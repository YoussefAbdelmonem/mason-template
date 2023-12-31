
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/Router/Router.dart';
import '../../../../../core/theme/dynamic_theme/colors.dart';
import '../../../../../core/utiles/extentions.dart';
import '../../../../../core/utiles/utiles.dart';
import '../../../../../shared/back_widget.dart';
import '../../../../../shared/widgets/button_widget.dart';
import '../../../../../shared/widgets/customtext.dart';
import '../../../../../shared/widgets/edit_text_widget.dart';
import '../../../cubit/auth_cubit.dart';
import '../../../cubit/auth_states.dart';
import '../../../domain/request/auth_request.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phone.dispose();
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
                "إنشاء حساب جديد",
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
                        "قم بإدخال بياناتك لأنشاء حساب جديد",
                        fontsize: 14,
                        color: Colors.black,
                        weight: FontWeight.w300,
                      ),
                      40.ph,
                      SvgPicture.asset(
                        "register".svg("icons"),
                        width: 212,
                        height: 212,
                      ),
                      50.ph,
                      TextFormFieldWidget(
                        backgroundColor: AppColors.primary.withOpacity(.04),
                        // padding: const EdgeInsets.symmetric(horizontal: 18),
                        type: TextInputType.name,
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.primary,
                        ),
                        hintText: 'الإسم',
                        password: false,
                        onSaved: (e) {},
                        validator: (v) => Utils.valid.defaultValidation(v),
                        controller: name,
                        borderRadius: 33,
                      ),
                      20.ph,
                      TextFormFieldWidget(
                        backgroundColor: AppColors.primary.withOpacity(.04),
                        // padding: const EdgeInsets.symmetric(horizontal: 18),
                        type: TextInputType.emailAddress,
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.primary,
                        ),
                        hintText: 'البريد الإلكترونى',
                        password: false,
                        validator: (v) => Utils.valid.emailValidation(v),
                        controller: email,
                        borderRadius: 33,
                      ),
                      20.ph,
                      TextFormFieldWidget(
                        backgroundColor: AppColors.primary.withOpacity(.04),
                        // padding: const EdgeInsets.symmetric(horizontal: 18),
                        type: TextInputType.phone,
                        prefixIcon: Icon(
                          Icons.phone_outlined,
                          color: AppColors.primary,
                        ),
                        hintText: 'رقم الجوال',
                        password: false,
                        // validator: (v) => Utils.valid.defaultValidation(v),
                        controller: phone,
                        borderRadius: 33,
                      ),
                      20.ph,
                      TextFormFieldWidget(
                        backgroundColor: AppColors.primary.withOpacity(.04),
                        // padding: const EdgeInsets.symmetric(horizontal: 18),
                        type: TextInputType.visiblePassword,
                        prefixIcon: Icon(Icons.lock_open_outlined,
                            color: AppColors.primary),
                        hintText: 'كلمة المرور',
                        password: true,
                        validator: (v) => Utils.valid.validatePassword(v),
                        controller: password,
                        borderRadius: 33,
                      ),
                      20.ph,
                      TextFormFieldWidget(
                        backgroundColor: AppColors.primary.withOpacity(.04),
                        // padding: const EdgeInsets.symmetric(horizontal: 18),
                        type: TextInputType.visiblePassword,
                        prefixIcon: Icon(Icons.lock_open_outlined,
                            color: AppColors.primary),
                        hintText: 'تأكيد كلمة المرور',
                        password: true,
                        validator: (v) => Utils.valid
                            .confirmPasswordValidation(v, password.text),
                        controller: confirmPassword,
                        borderRadius: 33,
                      ),
                      30.ph,

                      ButtonWidget(
                          title: "إنشاء حساب",
                          withBorder: true,
                          buttonColor: AppColors.primary,
                          textColor: Colors.white,
                          borderColor: AppColors.primary,
                          width: double.infinity,
                          // padding: const EdgeInsets.symmetric(horizontal: 15),
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            AuthRequest registerRequestModel = AuthRequest(
                              name: name.text.trim(),
                              email: email.text.trim(),
                              password: password.text.trim(),
                            );
                            if (formKey.currentState!.validate()) {
                              final response = await cubit.signUp(
                                registerRequestModel: registerRequestModel,
                              );
                              if (response == true) {
                                // Navigator.pushNamedAndRemoveUntil(
                                //   context,
                                //   Routes.OtpScreen,
                                // (route) => false,
                                //   arguments: OtpArguments(
                                //     sendTo: phone.text,
                                //     onSubmit: (s) async {
                                //       registerRequestModel.code = s;
                                //       final res = await cubit.activate(
                                //           registerRequestModel: registerRequestModel,);
                                //       if (res == true) {
                                //
                                //         Navigator.pushNamedAndRemoveUntil(context, Routes.LayoutScreen, (route) => false);
                                //       }
                                //
                                //     }, onReSend: ()async {
                                //     await cubit.resenCode(
                                //         mobile: registerRequestModel.mobile ?? '');
                                //   }
                                //   )
                                // );
                                // ignore: use_build_context_synchronously
                               
                                // Navigator.pushNamed(
                                //   context,
                                //   Routes.OtpScreen,
                                //   arguments: OtpArguments(
                                //       sendTo: email.text,
                                //       onSubmit: (s) async {
                                //         registerRequestModel.code = s;
                                //         final res = await cubit.activate(
                                //             registerRequestModel:
                                //                 registerRequestModel);

                                //         if (res == true) {
                                //           Navigator.pushNamedAndRemoveUntil(
                                //               context,
                                //               Routes.LayoutScreen,
                                //               (route) => false);
                                //         }
                                //       },
                                //       onReSend: () async {
                                //         await cubit.resendCode(
                                //             registerRequestModel.email ??
                                //                 '');
                                //       },
                                //       init: false),
                                // );
                             
                             
                              }
                              // if (response['data']['active'] == true) {
                              //   // if (response['data']['type'] == 'client') {
                              //   await FBMessging.subscribeToTopic();
                              //   // }
                              //   context.pushNamedAndRemoveUntil(Routes.layout);
                              // } else if (response['data']['active'] == false) {
                              //   Navigator.pushNamed(
                              //     context,
                              //     Routes.otp,
                              //     arguments: OtpArguments(
                              //         sendTo: phone.text,
                              //         onSubmit: (s) async {
                              //           final res = await cubit.activate(
                              //               mobile: phone.text, code: s);
                              //           if (res == true) {
                              //             await FBMessging.subscribeToTopic();
                              //             context.pushNamedAndRemoveUntil(
                              //                 Routes.layout);
                              //           }
                              //         },
                              //         onReSend: () async {
                              //           await cubit.resendCode(phone.text);
                              //         },
                              //         init: false),
                              //   );
                            }
                          }),
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
