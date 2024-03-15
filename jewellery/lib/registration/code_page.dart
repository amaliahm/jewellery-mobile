// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/routes/pages.dart';
import 'package:jewellery/widgets/show_dialog.dart';
import 'package:jewellery/widgets/style.dart';
import 'package:jewellery/widgets/title.dart';
import 'package:pinput/pinput.dart';
// import 'package:sms_autofill/sms_autofill.dart';
// import 'package:timer_count_down/timer_controller.dart';

class CodePage extends StatefulWidget {
  String verificationId;
  CodePage({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  double? containerHeight = Get.size.width / 7;
  String? code;
  FirebaseAuth auth = FirebaseAuth.instance;
  // CountdownController countdownController = CountdownController();

  @override
  void initState() {
    super.initState();
    // print(SmsAutoFill().getAppSignature);
    // countdownController.start();
  }

  @override
  void dispose() {
    super.dispose();
    // SmsAutoFill().unregisterListener();
  }


  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20, color: AppTheme.blue, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.blue),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppTheme.blue),
      borderRadius: BorderRadius.circular(20),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.white,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.babyblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(left: 25, right: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextTitle(text: 'Phone Verification'),
                const SizedBox(
                  height: 150,
                ),
                Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  showCursor: true,
                  onCompleted: (pin) {
                    setState(() {
                      code = pin;
                    });
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppTheme.blue,
                      borderRadius: BorderRadius.circular(40)),
                  child: RawMaterialButton(
                    onPressed: () async {
                      showLoading(context);
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: widget.verificationId,
                                smsCode: code!);
                        await auth.signInWithCredential(credential);
                      } on FirebaseAuthException catch (e) {
                        print(e);
                      }
                      if (auth.currentUser != null) {
                        print("#################### ${auth.currentUser}");
                        Get.toNamed(Routes.HOME);
                      } else {
                        showAlertDialog(
                            context,
                            "code false",
                            "rewrite the code",
                            () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CodePage(
                                    verificationId: widget.verificationId,
                                  ),
                                )));
                      }
                    },
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const Text(
                      "Verify Phone Number",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Text(
                    "Edit Phone Number ?",
                    style: TextStyle(
                        color: AppTheme.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
