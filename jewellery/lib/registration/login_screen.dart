import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/registration/code_page.dart';
import 'package:jewellery/widgets/show_dialog.dart';

import '../routes/pages.dart';
import '../widgets/have_account_or_not.dart';
import '../widgets/style.dart';
import '../widgets/text_filed.dart';
import '../widgets/title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _phone;

  FirebaseAuth auth = FirebaseAuth.instance;

  bool _errorPhone = false;

  @override
  void initState() {
    super.initState();
    _phone = TextEditingController();
  }

  @override
  void dispose() {
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset("assets/images/rectangle.png"),
              ),
              Positioned(
                bottom: -150,
                right: -150,
                child: Image.asset("assets/images/rectangle.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                      size: 50,
                    ),
                    onPressed: () => Get.toNamed(Routes.WELCOME)),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      TextTitle(text: 'Login'.toUpperCase()),
                      const Spacer(),
                      Column(
                        children: [
                          TextFiledWidget(
                              controller: _phone,
                              onChanged: (value) {
                                setState(() {
                                  _errorPhone = (value.length != 10 ||
                                      !value.contains(RegExp('[0-9]')));
                                });
                              },
                              hint_text: 'Phone number',
                              error: _errorPhone,
                              input_type: TextInputType.number,
                              notError: "correct your phone number please",
                              icon: Icons.phone),
                          const SizedBox(height: 50),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppTheme.blue,
                                borderRadius: BorderRadius.circular(40)),
                            child: RawMaterialButton(
                              onPressed: () async {
                                String phone =
                                    "+213${_phone.text.substring(1, 10)}";
                                if (_phone.text != null ) {
                                  try {
                                    await FirebaseAuth.instance
                                        .verifyPhoneNumber(
                                      phoneNumber: phone,
                                      verificationCompleted:
                                          (PhoneAuthCredential credential) {},
                                      verificationFailed:
                                          (FirebaseAuthException e) {
                                        showAlertDialog(
                                            context,
                                            "check your information",
                                            "rewrite information",
                                            () => Navigator.pop(context));
                                        print(
                                            "###################### verification failed");
                                        print(e);
                                      },
                                      codeSent: (String verificationId,
                                          int? resendToken) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CodePage(
                                                verificationId: verificationId,
                                              ),
                                            ));
                                      },
                                      codeAutoRetrievalTimeout:
                                          (String verificationId) {},
                                    );
                                    autoRetrievedSmsCodeForTesting:
                                    '123456';
                                    // Get.toNamed(Routes.HOME);
                                  } catch (e) {
                                    print("errrrrror ${e}");
                                  }
                                } else {
                                  showAlertDialog(
                                      context,
                                      "check your information",
                                      "verify",
                                      () => Navigator.pop(context));
                                }
                              },
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: const Text(
                                "Login",
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
                          AlreadyHaveAnAccountCheck(
                            press: () {
                              Get.toNamed(Routes.SIGNUP);
                            },
                            login: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                              onTap: () {
                                showAlertDialog(context, 'Send a message!!',
                                    "Reset Password", () => null);
                              },
                              child: const Text(
                                "Forget password",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppTheme.blue,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
