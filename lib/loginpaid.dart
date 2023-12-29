import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'logindemo/webview.dart';


class LoginPaid extends StatefulWidget {
  const LoginPaid({super.key});

  @override
  State<LoginPaid> createState() => _LoginPaidState();
}

class _LoginPaidState extends State<LoginPaid> {

  final TextEditingController username=TextEditingController();
  final TextEditingController password=TextEditingController();
  final TextEditingController confirmpassword=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 250),
            child: Text('Username',
            style: GoogleFonts.abrilFatface(
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: username,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Username",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 250),
            child: Text('Password',
              style: GoogleFonts.abrilFatface(
              ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: password,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Passworrd",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Home();
                }));
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                fixedSize: Size.fromWidth(200),
                // Disable the button while loading
              ),
            ),
          ),
        ],
      ),
    );
  }
}
