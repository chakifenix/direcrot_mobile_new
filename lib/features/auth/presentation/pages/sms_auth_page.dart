import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/util/show_snackbar.dart';
import 'package:direcrot_mobile_new/core/common/widgets/button.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/pages/save_phone.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/pages/set_pin_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class SmsAuthPage extends StatelessWidget {
  final String iin;
  final String email;
  SmsAuthPage({super.key, required this.iin, required this.email});
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 53.w, right: 20.w),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.isFailure) {
                showSnackBar(context, state.message ?? 'fail');
              } else if (state.isSuccess) {
                if (state.user?.phoneNumber == '' ||
                    state.user?.phoneNumber == null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SavePhone()));
                }
                Navigator.pushAndRemoveUntil(context,
                    SetPinPage.route(user: state.user), (route) => false);
              }
            },
            builder: (context, state) {
              if (state.isLoading) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Loader(),
                    ],
                  ),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 148.h,
                  ),
                  SvgPicture.asset('images/success.svg'),
                  SizedBox(
                    height: 22.h,
                  ),
                  Text(
                    'authSuccessTitle'.tr(),
                    style: AppTheme.authMediumTextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'authSuccessCont'.tr(),
                    style: AppTheme.authMediumTextStyle,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'authSuccessSent'.tr(),
                    style: AppTheme.authMediumTextStyle,
                  ),
                  Text(
                    email,
                    style: AppTheme.authMediumTextStyle.copyWith(
                        color: const Color(0xFF046BC8),
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                  Text(
                    'code'.tr(),
                    style: AppTheme.authMediumTextStyle,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Pinput(
                    controller: otpController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    defaultPinTheme: AppTheme.defaultPintheme,
                    length: 6,
                  ),
                  SizedBox(
                    height: 63.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 80.w,
                      ),
                      SizedBox(
                          width: 170.w,
                          child: AppButton(
                              title: 'next'.tr(),
                              pressAction: () {
                                context.read<AuthBloc>().add(AuthSmsLogin(
                                    code: otpController.text, iin: iin));
                              })),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
