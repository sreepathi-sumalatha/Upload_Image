// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import 'image_upload_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool isLoading = false;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login Screen'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Image.asset(
              "images/splash_screen.jpg",
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            TextFormField(
              validator: _validateEmail,
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Please enter your username',
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              validator: _validatePassword,
              controller: _passwordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Please enter your password',
                suffixIcon: IconButton(
                  icon: Icon(
                    !_obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              textInputAction: TextInputAction.done,
                obscureText: _obscurePassword,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageUploadScreen()),
                );
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('Processing Data')),
                    // );
                  }
               
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  textStyle: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
