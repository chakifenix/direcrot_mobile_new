import 'package:direcrot_mobile_new/features/onboard/presentation/pages/onboard_first.dart';
import 'package:direcrot_mobile_new/features/onboard/presentation/pages/onboard_pages.dart';
import 'package:direcrot_mobile_new/features/onboard/presentation/pages/select_language_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const OnboardingScreen());

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          SelectLanguagePage(
            controller: _controller,
          ),
          OnboardFirst(
            image: 'images/001.png',
            title: 'pg1t'.tr(),
            subTitle1: 'pg1c'.tr(),
            subTitle2:
                'в эффективном управлении времени и автоматизации контроля',
            controller: _controller,
          ),
          OnboardPages(
              image: 'images/002.png',
              title: 'pg2t'.tr(),
              subTitle1: 'pg2c'.tr(),
              subTitle2: 'subTitle2',
              spanHas: false,
              controller: _controller),
          OnboardPages(
              image: 'images/003.png',
              title: 'pg3t'.tr(),
              subTitle1: 'pg3c'.tr(),
              subTitle2: 'subTitle2',
              spanHas: false,
              controller: _controller),
          OnboardPages(
              image: 'images/004.png',
              title: 'pg4t'.tr(),
              subTitle1: 'pg4c'.tr(),
              subTitle2: 'subTitle2',
              spanHas: false,
              controller: _controller),
          OnboardPages(
              image: 'images/005.png',
              title: 'pg5t'.tr(),
              subTitle1: 'pg5c'.tr(),
              subTitle2: 'subTitle2',
              spanHas: false,
              controller: _controller),
          OnboardPages(
              image: 'images/006.png',
              title: 'pg6t'.tr(),
              subTitle1: 'pg6c'.tr(),
              subTitle2: 'subTitle2',
              spanHas: false,
              controller: _controller),
          OnboardPages(
              image: 'images/007.png',
              title: 'pg7t'.tr(),
              subTitle1: 'pg7c'.tr(),
              subTitle2: 'subTitle2',
              spanHas: false,
              lastPage: true,
              controller: _controller),
        ],
      ),
    );
  }
}
