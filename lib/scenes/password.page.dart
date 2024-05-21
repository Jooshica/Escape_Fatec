import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget {
  PasswordPage({super.key});

  final txtPassword = TextEditingController();

  final password = '7185';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Container(
          height: 240,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: txtPassword,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: const Text('Insira a senha'),
                  onPressed: () => Navigator.pushReplacementNamed(context, '/start'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}