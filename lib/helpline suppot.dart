import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpLineSupport extends StatefulWidget {
  @override
  _HelpLineSupportState createState() => _HelpLineSupportState();
}

class _HelpLineSupportState extends State<HelpLineSupport> {
  bool _isConnected = true; // Track the network status

  @override
  void initState() {
    super.initState();

    // Subscribe to connectivity changes
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
      });
    });

    // Check connectivity at the beginning
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = (connectivityResult != ConnectivityResult.none);
    });

    if (!_isConnected) {
      showNoInternetNotification();
    }
  }

  void showNoInternetNotification() {
    Fluttertoast.showToast(
      msg: "No internet connection. Please check your connection.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _isConnected
          ? SafeArea(
            child: WebView(
                    initialUrl:
                    'https://docs.google.com/forms/d/1RnofnB1J4zNPfScGleEYB5SENRM2j3B06sELWLH9wEU/edit', // Your web page URL here
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
          )
          : Center(
        child: Text(
          'No internet connection. Please check your connection.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HelpLineSupport(),
  ));
}
