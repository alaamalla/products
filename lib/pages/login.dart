import 'package:flutter/material.dart';
import 'package:products/main.dart';
import 'package:products/pages/bottomnavbar.dart';

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Create Account',
              style: TextStyle(
                color: dark_color,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: TextField(
                controller: username,
                cursorColor: dark_color,
                decoration: InputDecoration(
                  hintText: 'user name',
                  hintStyle: TextStyle(
                    color: light_color,
                  ),
                  label: Text('user name'),
                  labelStyle: TextStyle(
                    color: dark_color,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                controller: password,
                cursorColor: dark_color,
                decoration: InputDecoration(
                  hintText: 'password',
                  hintStyle: TextStyle(
                    color: light_color,
                  ),
                  label: Text('password'),
                  labelStyle: TextStyle(
                    color: dark_color,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (username.text.isNotEmpty && password.text.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavBar(),
                      ));
                }
              },
              child: Container(
                width: double.maxFinite,
                height: 50,
                decoration: BoxDecoration(
                  color: dark_color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Create',
                    style: TextStyle(
                      color: light_color,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
