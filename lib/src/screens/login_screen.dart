import 'package:flutter/material.dart';
import '../mixins/validations_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formState = GlobalKey<FormState>();
  String password = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40.0),
      child: Form(
        key: formState,
        child: Column(
          children: [
            emailField(), 
            passwordField(), 
            Container(margin: const EdgeInsets.only(bottom: 25.0),), 
            submitBtn()
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {
        email = value as String;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Password'
      ),
      obscureText: true,
      validator: validatePassword,
      onSaved: (value) {
        password = value as String;
      },
    );
  }
  Widget submitBtn() {
    return ElevatedButton(
      onPressed: () {
        if (formState.currentState!.validate()) {
          formState.currentState!.save();
          print("Send $password and $email to server");
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black), 
      child: const Text("Submit"),
    );
  }

}