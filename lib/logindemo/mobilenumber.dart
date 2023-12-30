import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kmoiti/logindemo/verification.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({Key? key}) : super(key: key);

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  final TextEditingController phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  String formatPhoneNumber(String phoneNumber, String countryCode) {
    // Remove any non-digit characters from the phone number
    String digits = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Combine the country code and digits
    return '+$countryCode$digits';
  }

  Future<void> otpnumber() async {
    try {
      // Ensure the phone number starts with the selected country code
      String phoneNumber = phoneController.text;
      String formattedPhoneNumber = formatPhoneNumber(phoneNumber, '91'); // Adjust the country code as needed

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: formattedPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Show toast message for sending verification code
          Fluttertoast.showToast(
            msg: "Verification code sent!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );

          // Navigate to the OTP verification screen and pass verificationId
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Verification(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      // Show toast message for error during phone number verification
      Fluttertoast.showToast(
        msg: "Error sending verification code: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntlPhoneField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber); // Prints the complete number.
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                otpnumber();
              },
              child: Text('Verify OTP'),
              style: ElevatedButton.styleFrom(fixedSize: Size.fromWidth(200)),
            ),
          ),
        ],
      ),
    );
  }
}
