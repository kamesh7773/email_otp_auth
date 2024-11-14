Here the example of all methods ✅

```dart
import 'package:flutter/material.dart';
import 'package:email_otp_auth/email_otp_auth.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // controllar's declartion
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ----------------------
    // Method for sending OTP
    // ----------------------

    Future<void> sendOtp() async {
      try {
        // showing CircularProgressIndicator.
        showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        // getting response from sendOTP Method.
        var res = await EmailOtpAuth.sendOTP(email: emailController.text);

        // poping out CircularProgressIndicator.
        if (context.mounted) {
          Navigator.of(context).pop();
        }

        // if response[message == "Email Send"] then..
        if (res["message"] == "Email Send" && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("OTP Send Successfully ✅"),
            ),
          );
        }
        // else show Invalid Email Address.
        else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Invalid E-Mail Address ❌"),
              ),
            );
          }
        }
      }
      // error handling
      catch (error) {
        throw error.toString();
      }
    }

    // ------------------------
    // Method for verifying OTP
    // ------------------------

    Future<void> verifyOTP() async {
      try {
        // showing CircularProgressIndicator.
        showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        // getting response from sendOTP Method.
        var res = await EmailOtpAuth.verifyOtp(otp: otpController.text);

        // poping out CircularProgressIndicator.
        if (context.mounted) {
          Navigator.of(context).pop();
        }

        // if response[message == "OTP Verified"] then..
        if (res["message"] == "OTP Verified" && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("OTP verified ✅"),
            ),
          );
        }
        // if response[message == "Invalid OTP"] then..
        else if (res["data"] == "Invalid OTP" && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid OTP ❌"),
            ),
          );
        }
        // if response[message == "OTP Expired"] then..
        else if (res["data"] == "OTP Expired" && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("OTP Expired ⚠️"),
            ),
          );
        }
        // else return nothing.
        else {
          return;
        }
      } catch (error) {
        throw error.toString();
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Text('Email OTP Auth'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: sendOtp,
                child: const Text('Send OTP'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: otpController,
                decoration: InputDecoration(
                  hintText: "OTP",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: verifyOTP,
                child: const Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


```
