import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          ? WebView(
        initialUrl:
        'https://www.kozhikode.directory/kmo-iti/i/1000', // Your web page URL here
        javascriptMode: JavascriptMode.unrestricted,
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
    home: Home(),
  ));
}
