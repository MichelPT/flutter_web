import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_web/pages/login.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                'Sign Up',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                    enabled: true,
                    labelText: 'Name',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
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
                  onPressed: () => Get.off(() => const LoginPage()),
                  child: const Text('Sign In')),
            ],
          ),
        ),
      ),
    );
  }
}
