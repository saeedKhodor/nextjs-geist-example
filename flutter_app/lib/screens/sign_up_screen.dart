import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onSaved: (value) => password = value ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // Handle sign up logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Signing up...')),
                    );
                  }
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 24),
              Center(child: Text('Or sign up with')),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  // Google sign up logic
                },
                icon: Icon(Icons.g_mobiledata),
                label: Text('Continue with Google'),
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
              ),
              SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {
                  // Facebook sign up logic
                },
                icon: Icon(Icons.facebook),
                label: Text('Continue with Facebook'),
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
              ),
              SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {
                  // Apple sign up logic
                },
                icon: Icon(Icons.apple),
                label: Text('Continue with Apple'),
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
