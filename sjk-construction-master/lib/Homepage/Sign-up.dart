import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sjk/Homepage/Forgot.dart';
import 'package:sjk/Homepage/Homepage.dart';
import 'package:sjk/Homepage/google-signin.dart';

import 'package:sjk/front/login_page.dart';

import '../SizeConfig.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _passwordVisible = false;
  TextEditingController? name;
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? confirm_password;
  @override
  void initState() {
    name = TextEditingController();
    email =  TextEditingController();
    password =  TextEditingController();
    confirm_password =  TextEditingController();
  }

  Future<void> _alertDialogBox(String error) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Error",
              style: TextStyle(color: Theme.of(context).focusColor),
            ),
            content: Text(
              error,
              style: TextStyle(
                  color: Colors.black, fontSize: SizeConfig.height! * 2),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Close Dialog",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  Future<String?> _signup() async {
    try {
      final User? currentUSer = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: email!.text, password: password!.text))
          .user;
      Map<String, dynamic> data = {
        "Uid": currentUSer!.uid,
        "Name": name!.text,
        "E-mail": email!.text,
        "Password": password!.text,
      };
      FirebaseFirestore.instance
          .collection("userdetails")
          .doc(currentUSer.uid)
          .set(data);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak_password') {
        return "The password is too weak";
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exist';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitform() async {
    String? feedback = await _signup();
    if (feedback != null) {
      _alertDialogBox(feedback);
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var _userPasswordController;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
            child: Column(children: [
              const Align(
                  alignment: Alignment.center,
                  child: Text('Get Started !',
                      style: TextStyle(
                          color: Color(0xff1248a3),
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Inter'))),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Full Name',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                    Container(
                        //
                        // Figma Flutter Generator Rectangle4Widget - RECTANGLE
                        margin:const  EdgeInsets.only(
                          top: 10,
                        ),
                        height: 52,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow:const  [
                            BoxShadow(
                              blurRadius: 2,
                            )
                          ],
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          borderRadius:const  BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: TextFormField(
                          controller: name,
                          cursorColor:const  Color(0xff01579B),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 10, bottom: 10, top: 10, right: 10),
                              hintText: "Enter your Full Name"),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    const  Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                    Container(
                        //
                        // Figma Flutter Generator Rectangle4Widget - RECTANGLE
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        height: 52,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow:const  [
                            BoxShadow(
                              blurRadius: 2,
                            )
                          ],
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: TextFormField(
                          controller: email,
                          cursorColor: const Color(0xff01579B),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 10, bottom: 10, top: 10, right: 10),
                              hintText: "Enter your Email"),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                    Container(
                        //
                        // Figma Flutter Generator Rectangle4Widget - RECTANGLE
                        margin:const  EdgeInsets.only(
                          top: 10,
                        ),
                        height: 52,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow:const  [
                            BoxShadow(
                              blurRadius: 2,
                            )
                          ],
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          borderRadius:const  BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: password,
                          obscureText: !_passwordVisible,
                          cursorColor:const  Color(0xff01579B),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding:const  EdgeInsets.only(
                                  left: 10, bottom: 10, top: 10, right: 10),
                              hintText: 'Enter Password'),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Confirm your Password',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                    Container(
                        //
                        // Figma Flutter Generator Rectangle4Widget - RECTANGLE
                        margin:const  EdgeInsets.only(
                          top: 10,
                        ),
                        height: 52,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow:const  [
                            BoxShadow(
                              blurRadius: 2,
                            )
                          ],
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          borderRadius:const  BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: confirm_password,
                          obscureText: !_passwordVisible,
                          cursorColor:const  Color(0xff01579B),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 10, bottom: 10, top: 10, right: 10),
                              hintText: 'Re-enter Password'),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      if (name!.text.isEmpty) {
                        _alertDialogBox("Name should not be Empty");
                      } else if (email!.text.isEmpty) {
                        _alertDialogBox("Email should not be Empty");
                      } else if (password!.text.isEmpty) {
                        _alertDialogBox("Password should not be Empty");
                      } else if (password!.text != confirm_password!.text) {
                        _alertDialogBox(
                            "Password and Confirm-password should be same");
                      } else {
                        _submitform();
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color:const  Color(0xff1248a3),
                          borderRadius: BorderRadius.circular(5)),
                      child:const  Center(
                          child: Text('SIGN-UP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 15,
              // ),
              // Expanded(
              //   flex: 11,
              //   child: Row(
              //     children: [
              //       Expanded(
              //         flex: 5,
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(vertical: 10.0),
              //           child: Container(
              //             height: 1.0,
              //             width: 130,
              //             color: Color(0xff1248a3),
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         flex: 1,
              //         child: Center(
              //           child: Container(
              //             child: Text('OR'),
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         flex: 5,
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(vertical: 10.0),
              //           child: Container(
              //             height: 1.0,
              //             width: 130,
              //             color: Color(0xff1248a3),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              // Align(
              //   alignment: Alignment.center,
              //   child: GestureDetector(
              //     onTap: () {
              //       googlesigninclass.googleLogin();
              //     },
              //     child: Container(
              //       height: 50,
              //       width: 220,
              //       decoration: BoxDecoration(
              //           color: Color(0xff1248a3),
              //           borderRadius: BorderRadius.circular(5)),
              //       child: Padding(
              //         padding: const EdgeInsets.all(12.0),
              //         child: Row(
              //           children: [
              //             Container(
              //                 height: 30,
              //                 width: 30,
              //                 child: Image(
              //                   image: AssetImage('assets/g1.png'),
              //                   fit: BoxFit.fill,
              //                 )),
              //             Padding(
              //               padding: const EdgeInsets.only(
              //                 left: 20,
              //                 right: 10,
              //               ),
              //               child: Align(
              //                   alignment: Alignment.centerRight,
              //                   child: Text('Sign-In with Google',
              //                       style: TextStyle(
              //                           color: Colors.white,
              //                           fontWeight: FontWeight.w500,
              //                           fontSize: 15))),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Row(
                children: [
                  const Padding(
                    padding:
                         EdgeInsets.only(left: 100, top: 25.0, bottom: 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Already A User?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => const Login()));
                    },
                    child:const  Padding(
                      padding:
                          EdgeInsets.only(top: 25.0, left: 5, bottom: 30),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Log-In',
                          style: TextStyle(
                            color: Color(0xff1248a3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          )),
    );
  }
}

class _passwordVisible {}
