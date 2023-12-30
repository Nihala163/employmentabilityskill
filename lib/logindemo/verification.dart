import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kmoiti/logindemo/webview.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatefulWidget {
  final String phoneNumber;

  const Verification({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  var otp = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initiate the auto-read verification process
    _startPhoneAuth();
  }

  Future<void> _startPhoneAuth() async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Sign in with the auto-received credential
        await FirebaseAuth.instance.signInWithCredential(credential);

        // Navigate to another page after successful verification
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(), // Replace with your destination page
          ),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Error during auto-read OTP validation: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        print("Code sent to ${widget.phoneNumber}");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Auto retrieval timeout. You can handle this if needed.");
      },
    );
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
              onChanged: (value) => otp = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: isLoading ? null : () => _verifyOtp(widget.phoneNumber),
              child: Text('Verify OTP'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(200),
                primary: isLoading ? Colors.grey : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _verifyOtp(String phoneNumber) async {
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
          builder: (context) => Home(), // Replace AnotherPage with your destination page
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
}
