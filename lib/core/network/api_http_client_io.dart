import 'dart:io' as io;

import 'package:connectrpc/connect.dart';
import 'package:connectrpc/io.dart';

HttpClient createApiHttpClient() => createHttpClient(io.HttpClient());
