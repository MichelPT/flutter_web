import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/pages/HomePage.dart';
import 'package:flutter_web/pages/singup.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pawrent',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Log In',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                    enabled: true,
                    labelText: 'Email',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    enabled: true,
                    labelText: 'Password',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => Get.off(() => const HomePage()),
                  child: Text('Sign In')),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Haven\'t got an account?'),
                  TextButton(
                      onPressed: () => Get.off(() => const SignUpPage()),
                      child: Text('Sign Up'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
