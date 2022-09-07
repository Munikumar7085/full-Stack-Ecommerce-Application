// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:full_stack_ecommerce/common/widgets/bottom_navigation.dart';
import 'package:full_stack_ecommerce/constants/error_handling.dart';
import 'package:full_stack_ecommerce/constants/util.dart';
import 'package:full_stack_ecommerce/models/user_model.dart';
import 'package:full_stack_ecommerce/provider/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/global_variables.dart';

class AuthenticationService {
  Future<void> signUpUser({
    required BuildContext context,
    required String name,
    required String password,
    required String email,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          token: '',
          type: '');
      print("created user $user");
      http.Response res = await http.post(
          Uri.parse("$API_URI/auth/api/signup"),
          body: user.toJson(),
          headers: <String, String>{'Content-Type': 'application/json'});
      print("response to the request  is $res");
      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, "Account successfully created! You can now signin");
        },
      );
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  Future<void> signInUser({
    required BuildContext context,
    required String password,
    required String email,
  }) async {
    try {
      http.Response res =
          await http.post(Uri.parse("$API_URI/auth/api/signin"),
              body: jsonEncode({
                "email": email,
                "password": password,
              }),
              headers: <String, String>{'Content-Type': 'application/json'});

      print("response to the request  is ${res.body}");
      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () async {
          try {
            final sharedPreferences = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await sharedPreferences.setString(
                SHARED_PREFERENCE_TOKEN_KEY, jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routeName, (route) => false);
          } catch (e) {
            print(e);
          }
        },
      );
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  Future<void> getUserData(BuildContext context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString(SHARED_PREFERENCE_TOKEN_KEY);
      if (token == null) {
        preferences.setString(SHARED_PREFERENCE_TOKEN_KEY, "");
      }
      var validationResponse = await http.post(
          Uri.parse('$API_URI/auth/api/validateToken'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            SHARED_PREFERENCE_TOKEN_KEY: token!
          });
      var userResponse = jsonDecode(validationResponse.body);
      if (userResponse == true) {
        var response = await http.get(
          Uri.parse('$API_URI/user/getData'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            SHARED_PREFERENCE_TOKEN_KEY: token
          },
        );
        print(response.body);
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(response.body);
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
    }
  }
}
