import 'package:flutter/material.dart';
import 'package:kmoiti/logindemo/webview.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  var otp='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFormField(
          //     keyboardType: TextInputType.number,
          //     decoration: InputDecoration(
          //       fillColor: Colors.white,
          //       filled: true,
          //       hintText: 'Enter OTP',
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //     ),
          //     onChanged: (value) => otp = value,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Pinput(
              keyboardType: TextInputType.number,
              length: 6,
              onChanged:(value) => otp = value,
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
              child: Text('Verify OTP'),
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
