import 'package:flutter/material.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
extension Passwordvalidator on String{
  bool isValidPassword(){
    return RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
    ).hasMatch(this);
  }
}
// String? validatePassword(String value) {
//   RegExp regex =
//   RegExp();
//   if (value.isEmpty) {
//     return 'Please enter password';
//   } else {
//     if (!regex.hasMatch(value)) {
//       return 'Enter valid password';
//     } else {
//       return null;
//     }
//   }
// }

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.white])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.black45,
            title: const Text('Sign In Form'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 50.0, right: 50.0, bottom: 120.0),
              child:  Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                  ),

              child: Form(
                key: _formKey,
                child: Column(
                    children:   [
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text("Sign In", style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),),
                      ),
                      const SizedBox(height: 20.0,),
                      const Align(alignment: Alignment.centerLeft,child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text("Email Address *", style: TextStyle(fontWeight: FontWeight.bold),),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            hintText: 'Enter email',
                          ),
                          validator: (input) => input!.isValidEmail() ? null : "Check your email",
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Align(alignment: Alignment.centerLeft, child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text("Password *",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                        child: TextFormField(
                          decoration:  InputDecoration(contentPadding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            hintText: 'Enter password',
                          ),
                          obscureText: true,
                          validator: (input) => input!.isValidPassword() ? null : "Check your password",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: ElevatedButton(
                            onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Processing Data')),
                                );
                              }
                            },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(240, 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                            child: const Text("Sign In"),
                        ),
                      ),
                    ],
                  ),
              ),
               ),
            ),
          ),
      ),
    );
  }
}
