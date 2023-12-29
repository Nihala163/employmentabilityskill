import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kmoiti/logindemo/verification.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({super.key});

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
final TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Number Verification"),
      ),
           body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 250),
            child: Text('Mobile Number',
            style: GoogleFonts.alkatra(
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // onChanged: (value) => phonenumber = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Verification();
                }));
              },
              child: Text('Send OTP'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                  fixedSize: Size.fromWidth(200),
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10))),
              
            ),
          ),
        ]
    ) ,
    );
  }
}
