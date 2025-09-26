import 'package:flutter/material.dart';
import 'data_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _showPassword = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_username.text == 'ui' && _password.text == '1234') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => DataScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('اسم المستخدم أو كلمة المرور غير صحيحة')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.login, size: 80, color: Colors.blue),
                SizedBox(height: 20),
                Text('تسجيل الدخول',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                SizedBox(height: 30),

                // حقل المستخدم
                TextFormField(
                  controller: _username,
                  decoration: InputDecoration(
                    labelText: 'اسم المستخدم',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      v!.isEmpty ? 'يرجى إدخال اسم المستخدم' : null,
                ),
                SizedBox(height: 15),

                // حقل كلمة المرور
                TextFormField(
                  controller: _password,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    labelText: 'كلمة المرور',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () =>
                          setState(() => _showPassword = !_showPassword),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      v!.isEmpty ? 'يرجى إدخال كلمة المرور' : null,
                ),
                SizedBox(height: 25),

                // زر الدخول
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: Text('دخول'),
                  ),
                ),
                SizedBox(height: 15),

                // تلميح بيانات
                Text(
                  'بيانات التجربة:\nاسم المستخدم: ui\nكلمة المرور: 1234',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }
}
