import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/button.dart';
import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/pages/failed_page.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/pages/sms_auth_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => const LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isMaxLength = false;
  final int _maxLength = 12;

  void _checkMaxLength() {
    setState(() {
      _isMaxLength = _controller.text.length >= _maxLength;
    });
  }

  @override
  void initState() {
    _controller.addListener(_checkMaxLength);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_checkMaxLength);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 75.w),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.isFailure) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FailedPage()));
              } else if (state.isSuccess) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SmsAuthPage(
                              iin: _controller.text,
                              email: state.email ?? '',
                            )));
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
                children: [
                  SizedBox(
                    height: 164.h,
                  ),
                  Text(
                    'auth'.tr(),
                    style: AppTheme.authLargeTextStyle,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'authText'.tr(),
                    style: AppTheme.authMediumTextStyle,
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  Text(
                    'authHint'.tr(),
                    style: AppTheme.authMediumTextStyle,
                  ),
                  TextFormField(
                    controller: _controller,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    maxLength: _maxLength,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: AppTheme.inputDecoration,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                      width: 170.w,
                      child: _isMaxLength
                          ? AppButton(
                              title: 'next'.tr(),
                              pressAction: () {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthIinLogin(iin: _controller.text));
                              })
                          : AppInactiveButton(
                              title: 'next'.tr(), pressAction: () {}))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
