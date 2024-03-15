import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/registration/code_page.dart';
import 'package:jewellery/widgets/have_account_or_not.dart';
import 'package:jewellery/widgets/show_dialog.dart';
import 'package:jewellery/widgets/style.dart';
import 'package:jewellery/widgets/text_filed.dart';
import 'package:jewellery/widgets/title.dart';

import '../routes/pages.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final TextEditingController _phone;
  late final TextEditingController _username;

  bool _errorPhone = false;
  bool _errorUsername = false;

  @override
  void initState() {
    _phone = TextEditingController();
    _username = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phone.dispose();
    _username.dispose();
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
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
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
                        TextTitle(text: 'Sign up'.toUpperCase()),
                        const SizedBox(
                          height: 50,
                        ),
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
                        TextFiledWidget(
                            controller: _username,
                            onChanged: (value) {
                              setState(() {
                                _errorUsername = (_username.text.length == 0 ||
                                    value.contains(RegExp('[0-9]')));
                              });
                            },
                            hint_text: 'Your name',
                            error: _errorUsername,
                            notError: "correct your name please",
                            icon: Icons.person),
                        const SizedBox(height: 50),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppTheme.blue,
                              borderRadius: BorderRadius.circular(40)),
                          child: RawMaterialButton(
                            onPressed: () async {
                              showLoading(context);
                              String phone =
                                  "+213${_phone.text.substring(1, 10)}";

                              if (_username != null &&
                                  _phone != null ) {
                                await FirebaseAuth.instance.verifyPhoneNumber(
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
                              } else {
                                showAlertDialog(
                                    context,
                                    "check your information",
                                    "rewrite information",
                                    () => Navigator.pop(context));
                              }
                            },
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        AlreadyHaveAnAccountCheck(
                          press: () {
                            Get.toNamed(Routes.LOGIN);
                          },
                          login: false,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Future<void> createUser(String email, String password , String username , String account_type) async {
  //   final user_exists = await check_user(account_type, email);
  //   if (user_exists) {
  //   try{
  //     showLoading(context);
  //     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     await userCredential.user!.updateDisplayName(username);
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return BackdropFilter(
  //             filter: ImageFilter.blur(
  //               sigmaX: 3.0,
  //               sigmaY: 3.0,
  //             ),
  //             child: AlertDialog(
  //               shadowColor: Colors.black,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(16.0),
  //                 side: BorderSide(
  //                   color: Colors.grey.withOpacity(0.2),
  //                 )
  //               ),
  //               title: Row(
  //                 children: [
  //                   const Text(
  //                     'verify your eamil ',
  //                     style: TextStyle(
  //                       color: Color(0xFF00246B),
  //                       fontFamily: 'Gadugi'),
  //                     ),
  //                     const SizedBox(width: 20,),
  //                     IconButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop(false);
  //                       },
  //                       icon: const Icon(
  //                         Icons.close,
  //                         size: 25,
  //                         color: Color(0xFF4F5054),
  //                       ),
  //                     ),
  //                 ],
  //               ),
  //               contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   ElevatedButton(
  //                     onPressed: () async {
  //                         await userCredential.user!.sendEmailVerification();
  //                         Navigator.of(context).pushNamedAndRemoveUntil(
  //                           '/login/',
  //                           (route) => false,
  //                         );
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: const Color(0xFFF4CA41)
  //                     ),
  //                     child: const Text(
  //                         'send email verification',
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontFamily: 'Gadugi'
  //                         ),
  //                       )
  //                     )
  //                  ],
  //               ),
  //             ),
  //           );
  //         }
  //       );
  //   } on FirebaseAuthException catch (e) {
  //     Navigator.of(context).pop(false);
  //     if (e.code == 'weak-password'){
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return BackdropFilter(
  //             filter: ImageFilter.blur(
  //               sigmaX: 3.0,
  //               sigmaY: 3.0,
  //             ),
  //             child: AlertDialog(
  //               shadowColor: Colors.black,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(16.0),
  //                 side: BorderSide(
  //                   color: Colors.grey.withOpacity(0.2),
  //                 )
  //               ),
  //               title: Row(
  //                 children: [
  //                   const Text(
  //                     'weak password ',
  //                     style: TextStyle(
  //                       color: Color(0xFF00246B),
  //                       fontFamily: 'Gadugi'),
  //                     ),
  //                     const SizedBox(width: 20,),
  //                 ],
  //               ),
  //               contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   ElevatedButton(
  //                     onPressed: () {
  //                       setState((){
  //                         Navigator.of(context).pop(false);
  //                       });
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: const Color(0xFFF4CA41)
  //                     ),
  //                     child: const Text(
  //                         ' rewrite ',
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontFamily: 'Gadugi'
  //                         ),
  //                       )
  //                     )
  //                  ],
  //               ),
  //             ),
  //           );
  //         }
  //       );
  //     }
  //     else if (e.code == 'email-already-in-use'){
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return BackdropFilter(
  //             filter: ImageFilter.blur(
  //               sigmaX: 3.0,
  //               sigmaY: 3.0,
  //             ),
  //             child: AlertDialog(
  //               shadowColor: Colors.black,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(16.0),
  //                 side: BorderSide(
  //                   color: Colors.grey.withOpacity(0.2),
  //                 )
  //               ),
  //               title: Row(
  //                 children: [
  //                   const SizedBox(width: 25,),
  //                   const Text(
  //                     'email already in use ',
  //                     style: TextStyle(
  //                       color: Color(0xFF00246B),
  //                       fontFamily: 'Gadugi'),
  //                     ),
  //                     const SizedBox(width: 20,),
  //                 ],
  //               ),
  //               contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   ElevatedButton(
  //                     onPressed: () {
  //                       setState((){
  //                         Navigator.of(context).pop(false);
  //                       });
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: const Color(0xFFF4CA41)
  //                     ),
  //                     child: const Text(
  //                         ' change email ',
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontFamily: 'Gadugi'
  //                         ),
  //                       )
  //                     )
  //                  ],
  //               ),
  //             ),
  //           );
  //         }
  //       );
  //     }
  //   } catch (e) {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return BackdropFilter(
  //             filter: ImageFilter.blur(
  //               sigmaX: 3.0,
  //               sigmaY: 3.0,
  //             ),
  //             child: AlertDialog(
  //               shadowColor: Colors.black,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(16.0),
  //                 side: BorderSide(
  //                   color: Colors.grey.withOpacity(0.2),
  //                 )
  //               ),
  //               title: Row(
  //                 children: [
  //                   const SizedBox(width: 25,),
  //                   const Text(
  //                     'there is problem ',
  //                     style: TextStyle(
  //                       color: Color(0xFF00246B),
  //                       fontFamily: 'Gadugi'),
  //                     ),
  //                     const SizedBox(width: 20,),
  //                 ],
  //               ),
  //               contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   ElevatedButton(
  //                     onPressed: () {
  //                       setState((){
  //                         Navigator.of(context).pop(false);
  //                       });
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: const Color(0xFFF4CA41)
  //                     ),
  //                     child: const Text(
  //                         ' fill it again ',
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontFamily: 'Gadugi'
  //                         ),
  //                       )
  //                     )
  //                  ],
  //               ),
  //             ),
  //           );
  //         }
  //       );
  //   }
  //   } else {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return BackdropFilter(
  //             filter: ImageFilter.blur(
  //               sigmaX: 3.0,
  //               sigmaY: 3.0,
  //             ),
  //             child: AlertDialog(
  //               shadowColor: Colors.black,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(16.0),
  //                 side: BorderSide(
  //                   color: Colors.grey.withOpacity(0.2),
  //                 )
  //               ),
  //               title: Row(
  //                 children: [
  //                   const SizedBox(width: 25,),
  //                   const Text(
  //                     "email doesn't exist",
  //                     style: TextStyle(
  //                       color: Color(0xFF00246B),
  //                       fontFamily: 'Gadugi'),
  //                     ),
  //                     const SizedBox(width: 20,),
  //                 ],
  //               ),
  //               contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   ElevatedButton(
  //                     onPressed: () {
  //                       setState((){
  //                         Navigator.of(context).pop(false);
  //                       });
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: const Color(0xFFF4CA41)
  //                     ),
  //                     child: const Text(
  //                         ' change email ',
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontFamily: 'Gadugi'
  //                         ),
  //                       )
  //                     )
  //                  ],
  //               ),
  //             ),
  //           );
  //         }
  //       );
  //   }
  // }

  // Future<bool> check_user(String the_account_type ,String the_email) async{
  //   final my_user_ref = FirebaseFirestore.instance.collection(the_account_type);
  //   final querySnapshot = await my_user_ref
  //   .where("email" , isEqualTo: the_email)
  //   .get();
  //   return querySnapshot.docs.isNotEmpty;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RawMaterialButton(
                      onPressed: () async {
                        // final email = _phone.text;
                        // final password = _password.text;
                        // final username = _username.text;
                        // await createUser(
                        //     email, password, username, account_type);
                      },
                    ),
                  )),
            ),
          ],
        ),
      ]),
    );
  }
}
