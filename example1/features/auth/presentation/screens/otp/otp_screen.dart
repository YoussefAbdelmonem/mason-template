
import 'package:pinput/pinput.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helper/alerts.dart';
import '../../../../../core/theme/dynamic_theme/colors.dart';
import '../../../../../core/utiles/extentions.dart';
import '../../../../../core/utiles/utiles.dart';
import '../../../../../shared/back_widget.dart';
import '../../../../../shared/widgets/button_widget.dart';
import '../../../../../shared/widgets/customtext.dart';
class OtpScreen extends StatefulWidget {
  final String sendTo;
  final Function(String code) onSubmit;
  final bool? init;
  final VoidCallback onReSend;
  const OtpScreen({
    super.key,
    required this.sendTo,
    required this.onSubmit,
    required this.onReSend,
    this.init,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();
  DateTime target = DateTime.now().add(const Duration(minutes: 5));
  DateTime now = DateTime.now();
  Timer? timer;
  String remainigTime = '02:00';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.init == true) widget.onReSend.call();
      startTimer();
    });
    super.initState();
  }

  void startTimer() {
    target = DateTime.now().add(const Duration(minutes: 2));
    now = DateTime.now();
    timer = Timer.periodic(const Duration(seconds: 1), (s) {
      if (now.isBefore(target)) {
        now = now.add(const Duration(seconds: 1));
        remainigTime =
            '${target.difference(now).inMinutes}:${target.difference(now).inSeconds.remainder(60)}';
        setState(() {});
      } else {
        remainigTime = '';
        timer!.cancel();
      }
    });
  }

  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    timer!.cancel();
    otpController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          'كود التحقق',
          fontsize: 18,
          color: AppColors.onPrimary,
          weight: FontWeight.w700,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  'أدخل كود التحقق الذى تم إرسالة إليك عبر البريد الالكتروني',
                  fontsize: 14,
                  color: Colors.black,
                  weight: FontWeight.w300,
                ),
                24.ph,
                CustomText(
                  widget.sendTo,
                  fontsize: 14,
                  color: AppColors.primary,
                  weight: FontWeight.w300,
                ),
                40.ph,
                SvgPicture.asset(
                  "otp".svg("icons"),
                  width: 212,
                  height: 212,
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      // smsCodeMatcher: PinputConstants.defaultSmsCodeMatcher,
                      length: 4,
                      autofocus: false,
                      // errorText: otpError,
                      // onClipboardFound: (s) {},
                      controller: otpController,
                      defaultPinTheme: PinTheme(
                        textStyle: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        width: 65.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(.05),
                          borderRadius: BorderRadius.circular(33.0),
                          // border: Border.all(
                          //   color: Colors.black,
                          //   width: 1.0,
                          // ),
                          //shape: BoxShape.circle,
                        ),
                      ),
                      followingPinTheme: PinTheme(
                          textStyle: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary),
                          width: 65.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(.05),
                            borderRadius: BorderRadius.circular(33.0),
                            // border: Border.all(
                            //   color: Colors.black,
                            //   width: 1.0,
                            // ),
                            //shape: BoxShape.circle,
                          )),
                      pinAnimationType: PinAnimationType.scale,
                      validator: Utils.valid.defaultValidation,
                      onCompleted: (pin) async => await widget.onSubmit(pin),
                    ),
                  ),
                ),
                50.ph,
                ButtonWidget(
                  title: 'إرسال',
                  withBorder: true,
                  buttonColor: AppColors.primary,
                  textColor: Colors.white,
                  borderColor: AppColors.primary,
                  width: double.infinity,
                  // padding: const EdgeInsets.symmetric(horizontal: 15),
                  onTap: () async {
                    // Navigator.pushNamed(context, Routes.layout);
                    if (formKey.currentState!.validate()) {
                      if (otpController.text.length < 4) {
                        Alerts.snack(
                            text: "الكود غير صحيح", state: SnackState.failed);
                      } else {
                        await widget.onSubmit(otpController.text);
                      }
                    }
                  },
                ),
                16.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      "لم يتم إرسال الكود ؟",
                    ),
                    8.pw,
                    16.ph,
                    remainigTime.isEmpty
                        ? GestureDetector(
                            child: CustomText(
                              "إعادة إرسالة",
                              color: AppColors.primary,
                              weight: FontWeight.w500,
                            ),
                            onTap: remainigTime.isEmpty
                                ? () async {
                                    widget.onReSend.call();
                                    print('object');
                                    remainigTime = '60';
                                    setState(() {});
                                    startTimer();
                                  }
                                : null)
                        : Center(
                            child: CustomText(
                              '$remainigTime ',
                              color: AppColors.grey,
                            ),
                          ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}