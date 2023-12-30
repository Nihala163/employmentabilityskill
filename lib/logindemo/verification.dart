import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmoiti/logindemo/webview.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatefulWidget {
  final String verificationId;

  const Verification({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  var otp = "";
  bool isLoading = false;

  Future<void> verifyOtp() async {
    try {
      setState(() {
        isLoading = true;
      });

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      // OTP validated successfully, navigate to another page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>Home(), // Replace AnotherPage with your destination page
        ),
      );
    } catch (e) {
      print("Error during OTP validation: $e");

      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid OTP. Please try again."),
          duration: Duration(seconds: 3),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

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
              onPressed: isLoading ? null : verifyOtp,
              child: Text('Verify OTP'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(200),
                // Disable the button while loading
                primary: isLoading ? Colors.grey : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}