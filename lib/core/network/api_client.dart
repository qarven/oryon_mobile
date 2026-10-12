import 'package:connectrpc/connect.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart' as protocol;
import 'package:oryon_mobile/core/config/app_config.dart';
import 'package:oryon_mobile/core/logging/app_logger.dart';
import 'package:oryon_mobile/core/logging/correlation_id.dart';
import 'package:oryon_mobile/core/network/api_http_client.dart';
import 'package:oryon_mobile/features/auth/services/auth_session.dart';

protocol.Transport createApiTransport(AuthSession session) =>
    protocol.Transport(
      baseUrl: AppConfig.apiBaseUrl,
      codec: const ProtoCodec(),
      httpClient: createApiHttpClient(),
      interceptors: [
        bearerTokenInterceptor(session),
        correlationInterceptor(),
      ],
    );

Interceptor bearerTokenInterceptor(AuthSession session) =>
    <I extends Object, O extends Object>(next) => (request) {
      final token = session.accessToken;
      if (token != null) {
        request.headers.add('authorization', 'Bearer $token');
      }
      return next(request);
    };

/// Tags each RPC with a correlation id, forwards it as a header so the backend
/// can log the same id, and records the outcome. The id stays live across the
/// awaited call, so anything logged while handling the response joins the
/// trace.
Interceptor correlationInterceptor() =>
    <I extends Object, O extends Object>(next) => (request) {
      final inbound = request.headers.get(CorrelationId.header)?.firstOrNull;
      final correlation = CorrelationId.generate(inbound: inbound);
      request.headers.set(CorrelationId.header, [correlation.value]);

      return CorrelationId.runWith(correlation, () async {
        final procedure = request.spec.procedure;
        AppLogger.debug(
          'rpc.request',
          data: {'procedure': procedure, 'url': request.url},
        );
        final timer = Stopwatch()..start();
        try {
          final response = await next(request);
          AppLogger.info(
            'rpc.response',
            data: {'procedure': procedure, 'ms': timer.elapsedMilliseconds},
          );
          return response;
        } catch (error, stackTrace) {
          AppLogger.error(
            'rpc.failed',
            error: error,
            stackTrace: stackTrace,
            data: {'procedure': procedure, 'ms': timer.elapsedMilliseconds},
          );
          rethrow;
        }
      });
    };
