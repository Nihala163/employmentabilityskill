import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kmoiti/helpline%20suppot.dart';
import 'package:kmoiti/logindemo/mobilenumber.dart';
import 'package:kmoiti/loginpaid.dart';

import 'logindemo/webview.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('EMPLOYBILITY SKILLS TRAINING APP ',
                textAlign: TextAlign.center,
                style: GoogleFonts.abrilFatface(
                fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color:Colors.blue ),),
            ),
            Container(height: 400,width: 500,
                child: const Image(image: AssetImage('assets/EMPLOYIBILITY.png'),)),
            Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return MobileNumber();
                      }));
                    },
                    child: Text('Login Demo'),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.orange,
                        fixedSize: Size.fromWidth(200),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: ElevatedButton(onPressed: (){}, child: const Text('Login Paid'),
                //     style: ElevatedButton.styleFrom(
                //         backgroundColor:  Color(0XFFFFD700),
                //         foregroundColor: Colors.white,
                //         fixedSize: Size.fromWidth(200),
                //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return LoginPaid();
                    }));
                  }, child: const Text('Login Paid'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:  Color(0XFF4169E1),
                        foregroundColor: Colors.white,
                        fixedSize: Size.fromWidth(200),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return HelpLineSupport();
                    }));
                  }, child: const Text('Help Line'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:  Colors.blue,
                          foregroundColor: Colors.white,
                          fixedSize:Size.fromWidth(200),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      )
                  ),
                ),
              ],
            ),
        
          ],
        ),
      ),
    );
  }
}