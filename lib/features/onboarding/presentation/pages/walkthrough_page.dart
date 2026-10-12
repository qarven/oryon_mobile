import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/app/router/app_navigation_router.dart';
import 'package:oryon_mobile/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:oryon_mobile/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:oryon_mobile/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:oryon_mobile/features/onboarding/presentation/widgets/progress_button.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

class WalkthroughPage extends StatelessWidget {
  const WalkthroughPage({super.key});

  void _complete(OnboardingBloc bloc) => bloc.add(const OnboardingCompleted());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OnboardingBloc>();
    final slides = [
      (
        title: l10n.onboardingTitle1,
        image: 'assets/images/onboard1.png',
        body: l10n.onboardingBody1,
      ),
      (
        title: l10n.onboardingTitle2,
        image: 'assets/images/onboard2.png',
        body: l10n.onboardingBody2,
      ),
      (
        title: l10n.onboardingTitle3,
        image: 'assets/images/onboard3.png',
        body: l10n.onboardingBody3,
      ),
    ];

    return BlocListener<OnboardingBloc, OnboardingState>(
      listenWhen: (previous, current) =>
          !previous.completed && current.completed,
      listener: (context, state) => GoRouter.of(context).goToHome(),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: bloc.pages,
                itemCount: slides.length,
                onPageChanged: (val) => bloc.add(OnboardingPageChanged(val)),
                itemBuilder: (_, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(slides[index].image),
                    context.gapMD,
                    Text(
                      slides[index].title,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headlineMedium,
                    ),
                    context.gapMD,
                    Text(
                      slides[index].body,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ).paddingSymmetric(horizontal: AppSpacing.xxxl),
              ),
            ),
            Padding(
              padding: context.paddingLG,
              child: BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  final isLast = state.page == OnboardingBloc.maxPage;
                  return ProgressButton(
                    progress: (state.page + 1) / slides.length,
                    icon: isLast ? Icons.check : Icons.chevron_right,
                    label: isLast
                        ? l10n.onboardingGetStarted
                        : l10n.onboardingNext,
                    onPressed: isLast
                        ? () => _complete(bloc)
                        : () => bloc.pages.nextPage(
                            duration: AppMotion.medium,
                            curve: AppMotion.easeOut,
                          ),
                  );
                },
              ),
            ),
          ],
        ).safeArea(),
      ),
    );
  }
}
