import 'package:florist_app/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.greenAccent, Color.fromARGB(167, 178, 255, 89)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Create Your Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextField(
                    controller: _nameController,
                    hintText: 'Name',
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextField(
                    controller: _surnameController,
                    hintText: 'Surname',
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: "Password",
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    hintText: 'Confirm Password',
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      //My logic her
                      String name = _nameController.text;
                      String surname = _surnameController.text;
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      String confirmPassword = _confirmPasswordController.text;

                      if (password == confirmPassword) {
                        print(
                            'Account created for $name $surname with email $email');
                        // Go back bro to loginscreen
                        Navigator.pop(context);
                      } else {
                        print('Passwords do not match');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 15.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
