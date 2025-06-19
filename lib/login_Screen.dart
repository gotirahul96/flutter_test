import 'package:flutter/material.dart';
import 'package:testapp/home_Screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                key: Key('user'),
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: 'UserName'
                ),
                validator: (s){
                  if (s!.trim().isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
               TextFormField(
                key: Key('pass'),
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
                validator: (s){
                  if (s!.trim().isEmpty) {
                    return 'Invalid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                  key: Key('loginButton'),

                onTap: (){
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                  else {
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('UserName & Password cannot be empty'),
                        actions: [
                          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Ok'))
                        ],
                      );
                    });
                  }
                  
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Login',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}