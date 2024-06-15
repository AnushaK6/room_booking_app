import 'package:flutter/material.dart';
import 'package:room_booking/services/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formGlobalKey = GlobalKey<FormState>();
  String? _username;
  String? _passwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Login",
                style: TextStyle(
                  fontSize: 54,
                  color: Colors.purple,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50,),
              Form(
                  key: _formGlobalKey,
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text('Username/Email')
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'You must enter username';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _username=value!;
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Password')
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'You must enter password';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _passwd=value!;
                    },
                  ),
                  const SizedBox(height: 50),
                  FilledButton(
                    onPressed: () async {
                      if (_formGlobalKey.currentState!.validate()) {
                        _formGlobalKey.currentState!.save();

                        await User.getUser(_username.toString(), _passwd.toString(), context);
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                   child: const Text('Login'),
                  ),
                ],
              ))
            ],
          ),
        ),
      )
    );
  }
}
