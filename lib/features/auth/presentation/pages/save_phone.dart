import 'package:direcrot_mobile_new/core/common/widgets/button.dart';
import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/util/show_snackbar.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/pages/set_pin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';

class SavePhone extends StatefulWidget {
  const SavePhone({super.key});

  @override
  State<SavePhone> createState() => _SavePhoneState();
}

class _SavePhoneState extends State<SavePhone> {
  final TextEditingController controller = TextEditingController();

  final maskFormatter = MaskInputFormatter(
    mask: '+# (###) ###-##-##',
  );

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.pushAndRemoveUntil(
                context, SetPinPage.route(user: state.user), (route) => false);
          } else if (state.isFailure) {
            showSnackBar(context, 'fail');
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите номер';
                      }
                      return null;
                    },
                    controller: controller,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    inputFormatters: [maskFormatter],
                    style: const TextStyle(color: Colors.black),
                    decoration: AppTheme.inputDecoration.copyWith(
                      hintText: '+7(777) 777 77 77',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AppButton(
                      title: 'Отправить',
                      pressAction: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(SavePhoneNumberFetch(
                              controller.text.replaceAll(RegExp(r'\D'), '')));
                        }
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
