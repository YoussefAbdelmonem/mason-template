import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/Router/Router.dart';
import '../../../../../core/theme/dynamic_theme/colors.dart';
import '../../../../../core/utiles/extentions.dart';
import '../../../../../shared/back_widget.dart';
import '../../../../../shared/widgets/button_widget.dart';
import '../../../../../shared/widgets/customtext.dart';
import '../../../../../shared/widgets/edit_text_widget.dart';
import '../../../cubit/auth_cubit.dart';
import '../../../cubit/auth_states.dart';

import '../../../domain/request/auth_request.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = AuthCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                leadingWidth: 80,
                // toolbarHeight: 80,
                leading: BackWidget(
                  isCircle: true,
                  size: 20,
                ),
                title: CustomText(
                  'هل نسيت كلمة المرور',
                  fontsize: 18,
                  color: AppColors.onPrimary,
                  weight: FontWeight.w700,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        'قم بإدخال بياناتك لتسجيل الدخول',
                        fontsize: 14,
                        color: Colors.black,
                        weight: FontWeight.w300,
                      ),
                      40.ph,
                      SvgPicture.asset(
                        "forget_pass".svg("icons"),
                        width: 212,
                        height: 212,
                      ),
                      50.ph,
                      TextFormFieldWidget(
                        backgroundColor: AppColors.primary.withOpacity(.04),
                        // padding: const EdgeInsets.symmetric(horizontal: 18),
                        type: TextInputType.emailAddress,
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.primary,
                        ),
                        hintText: 'البريد الالكتروني',
                        password: false,
                        validator: (v) => Utils.valid.emailValidation(v),
                        controller: email,
                        borderRadius: 33,
                      ),
                      30.ph,
                      ButtonWidget(
                        title: 'إرسال',
                        withBorder: true,
                        buttonColor: AppColors.primary,
                        textColor: Colors.white,
                        borderColor: AppColors.primary,
                        width: double.infinity,
                        // padding: const EdgeInsets.symmetric(horizontal: 15),
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            final response = await cubit.forgetPass(email.text);
                            if (response != null) {
                              Navigator.pushNamed(context, Routes.OtpScreen,
                                  arguments: OtpArguments(
                                    sendTo: email.text,
                                    onSubmit: (code) async {
                                      final res = await cubit.sendCode(
                                          email: email.text, code: code);
                                      if (res == true) {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.ResetPassword,
                                          arguments: NewPasswordArgs(
                                            code: cubit.codeId,
                                            email: email.text,
                                          ),
                                        );
                                      }
                                    },
                                    onReSend: () async {
                                      await cubit.resendCode(email.text);
                                    },
                                    init: false,
                                  ));
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}