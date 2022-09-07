// ignore_for_file: unused_field, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:full_stack_ecommerce/common/widgets/button.widget.dart';
import 'package:full_stack_ecommerce/common/widgets/text_edit_from.dart';
import 'package:full_stack_ecommerce/constants/global_variables.dart';
import 'package:full_stack_ecommerce/services/authentication_service.dart';

enum Auth { signup, signin }

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const authScreen = '/auth-screen';
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpkey = GlobalKey<FormState>();
  final _signInkey = GlobalKey<FormState>();
  final TextEditingController _signupEmailController = TextEditingController();
  final TextEditingController _signupPasswordController =
      TextEditingController();
  final TextEditingController _signupUserNameController =
      TextEditingController();
  final AuthenticationService _authenticationService = AuthenticationService();
  final TextEditingController _signinEmailController = TextEditingController();
  final TextEditingController _signinPasswordController =
      TextEditingController();
  @override
  void dispose() {
  
    _signupEmailController.dispose();
    _signupPasswordController.dispose();
    _signupUserNameController.dispose();
    _signinEmailController.dispose();
    _signinPasswordController.dispose();
    super.dispose();
    
  }

  void signUpUser() {
    _authenticationService.signUpUser(
        context: context,
        name: _signupUserNameController.text,
        password: _signupPasswordController.text,
        email: _signupEmailController.text);
    print('signUpUser called');
  }

  void signInUser() {
    _authenticationService.signInUser(
        context: context,
        password: _signinPasswordController.text,
        email: _signinEmailController.text);
    print('signInUser called');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundColor,
        body: ListView(
          children: [
            const Text(
              "Welcome",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? Colors.white
                  : GlobalVariables.greyBackgroundColor,
              title: const Text(
                "Create Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            if (_auth == Auth.signup)
              Form(
                  key: _signUpkey,
                  child: Container(
                    color: Colors.white,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          TextEditForm(
                            controller: _signupUserNameController,
                            icon: Icons.person,
                            label: "user name",
                            hint: "john",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextEditForm(
                            controller: _signupEmailController,
                            icon: Icons.mail,
                            label: "Email",
                            hint: "example@gmail.com",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswordTextFormField(
                            controller: _signupPasswordController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              text: "Sign Up",
                              action: () {
                                bool validate =
                                    _signUpkey.currentState!.validate();
                                print((validate));
                                if (validate) {
                                  print("singup button clicked");
                                  signUpUser();
                                }
                              }),
                        ],
                      ),
                    ),
                  )),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? Colors.white
                  : GlobalVariables.greyBackgroundColor,
              title: const Text(
                "Sign-in",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            if (_auth == Auth.signin)
              Form(
                  key: _signInkey,
                  child: Container(
                    color: Colors.white,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          TextEditForm(
                            controller: _signinEmailController,
                            icon: Icons.mail,
                            label: "Email",
                            hint: "example@gmail.com",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswordTextFormField(
                            controller: _signinPasswordController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              text: "Sign In",
                              action: () {
                                if (_signInkey.currentState!.validate()) {
                                  signInUser();
                                }
                              }),
                        ],
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
