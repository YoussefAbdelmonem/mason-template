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
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AuthRequest authRequest = AuthRequest();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
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
                size: 20,
              ),
              title: CustomText(
                'تسجيل الدخول',
                fontsize: 18,
                color: AppColors.onPrimary,
                weight: FontWeight.w700,
              ),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        "login".svg("icons"),
                        width: 212,
                        height: 212,
                      ),
                      50.ph,
                      /*  TextFormFieldWidget(
                        backgroundColor: AppColors.primary.withOpacity(.04),
                        // padding: const EdgeInsets.symmetric(horizontal: 18),
                        type: TextInputType.phone,
                        prefixIcon: Icon(
                          Icons.phone_outlined,
                          color: AppColors.primary,
                        ),
                        hintText: 'رقم الجوال',
                        hintColor: Color(0xff001F6E),

                        password: false,
                        validator: (v) => Utils.valid.defaultValidation(v),
                        controller: phone,
                        borderRadius: 33,
                      ), */
                      TextFormFieldWidget(
                        backgroundColor: AppColors.primary.withOpacity(.04),
                        // padding: const EdgeInsets.symmetric(horizontal: 18),
                        type: TextInputType.emailAddress,
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.primary,
                        ),
                        hintText: 'البريد الالكتروني',
                        hintColor: Color(0xff001F6E),

                        password: false,
                        // validator: (v) => Utils.valid.emailValidation(v),
                        controller: email,
                        borderRadius: 33,
                      ),
                      20.ph,
                      TextFormFieldWidget(
                        hintColor: Color(0xff001F6E),
                        backgroundColor: AppColors.primary.withOpacity(.04),
                        // padding: const EdgeInsets.symmetric(horizontal: 18),
                        type: TextInputType.visiblePassword,
                        prefixIcon: Icon(Icons.lock_open_outlined,
                            color: AppColors.primary),
                        hintText: 'كلمة المرور',
                        password: true,
                        // validator: (v) => Utils.valid.validatePassword(v),
                        controller: password,
                        borderRadius: 33,
                      ),
                      30.ph,

                      TextButtonWidget(
                          text: 'هل نسيت كلمة المرور ؟',
                          size: 14,
                          color: AppColors.grey,
                          // weight: w300,
                          function: () {
                            Navigator.pushNamed(
                                context, Routes.forget_passScreen);
                          }),

                      30.ph,
                      ButtonWidget(
                        title: 'تسجيل الدخول',
                        withBorder: true,
                        buttonColor: AppColors.primary,
                        textColor: Colors.white,
                        borderColor: AppColors.primary,
                        width: double.infinity,
                        fontSize: 18,
                        fontweight: FontWeight.bold,
                        // padding: const EdgeInsets.symmetric(horizontal: 15),
                        onTap: () async {
                          AuthRequest registerModel = AuthRequest(
                            password: password.text,
                            email: email.text,
                          );
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            final response = await cubit.login(
                              loginRequestModel: registerModel);
                            if (response == true) {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  Routes.LayoutScreen, (route) => false);
                            } else if (response == false) {
                              // Alerts.snack(
                              //     text: 'You have to activate your account'
                              //         .tr(),
                              //     state: SnackState.failed);
                              // Navigator.pushNamed(
                              //   context,
                              //   Routes.OtpScreen,
                              //   arguments: OtpArguments(
                              //       sendTo: email.text,
                              //       onSubmit: (s) async {
                              //         registerModel.code = s;
                              //         final res = await cubit.activate(
                              //             registerRequestModel: registerModel);

                              //         if (res == true) {
                              //           Navigator.pushNamedAndRemoveUntil(
                              //               context,
                              //               Routes.LayoutScreen,
                              //               (route) => false);
                              //         }
                              //       },
                              //       onReSend: () async {
                              //         await cubit.resenCode(
                              //             email: registerModel.email ?? '');
                              //       },
                              //       init: false),
                              // );
                            }
                          }
                        },
                      ),
                      20.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            "ليس لديك حساب ؟",
                            fontsize: 14,
                            color: AppColors.onPrimary,
                            weight: FontWeight.w400,
                          ),
                          8.pw,
                          TextButtonWidget(
                              text: "حساب جديد",
                              // fontsize: 14,
                              // padding: const EdgeInsets.symmetric(horizontal: 15),
                              color: AppColors.primary,
                              // weight: w300,
                              function: () {
                                Navigator.pushReplacementNamed(
                                    context, Routes.RegisterScreen);
                              }),
                        ],
                      ),
                      20.ph,
                      ButtonWidget(
                        title: 'الدخول كزائر',
                        withBorder: true,
                        buttonColor: Colors.white,
                        textColor: AppColors.primary,
                        borderColor: AppColors.primary,
                        width: double.infinity,

                        // padding: const EdgeInsets.symmetric(horizontal: 15),
                        onTap: () async {
                          Navigator.pushNamed(
                            context,
                            Routes.LayoutScreen,
                          );
                        },
                      ),
                      // signupBtn(context),
                      20.ph,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
