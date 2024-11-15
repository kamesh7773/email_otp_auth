---

# 📧 Email OTP Auth

A simple Flutter package for **email-based OTP authentication**! This package allows developers to send a 6-digit OTP to a user’s email and verify it for seamless email authentication. Perfect for apps that require email-based verification!

## 🌟 Features
- 🔑 **Send OTP**: Generate and send a 6-digit OTP to the specified email address.
- ✅ **Verify OTP**: Verify the OTP input to confirm the email's authenticity.
- ⚠️ **Expiration Time**: OTP will expired after 5 minutes.

## 🚀 Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  email_otp_auth: ^1.0.0
```

Then, run:

```bash
flutter pub get
```

## 📲 Usage

### Import the package

```dart
import 'package:email_otp_auth/email_otp_auth.dart';
```

### Sending and Verifying OTP

Here's how to use the package to send and verify an OTP:

```dart
import 'package:flutter/material.dart';
import 'package:email_otp_auth/email_otp_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  Future<void> sendOtp() async {
    var response = await EmailOtpAuth.sendOTP(email: emailController.text);
    if (response["message"] == "Email Sent") {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP sent successfully! ✅")),
      );
    } else {
      // Handle failure
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to send OTP ❌")),
      );
    }
  }

  Future<void> verifyOtp() async {
    var response = await EmailOtpAuth.verifyOtp(otp: otpController.text);
    if (response["message"] == "OTP Verified") {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP verified! 🎉")),
      );
    } else {
      // Handle error cases
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid or expired OTP ⚠️")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email OTP Authentication"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email Address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: sendOtp,
              child: const Text("Send OTP"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: otpController,
              decoration: const InputDecoration(
                labelText: "Enter OTP",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: verifyOtp,
              child: const Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 📸 Screenshots

| OTP Send successfully ✅ | OTP Verified ✅ | OTP Invalid ⛔| OTP Expired ⚠️ |
|----------|--------------|-------------|-------------|
| ![OTP Send](https://github.com/kamesh7773/email_otp_auth/blob/main/assets/OTPSendSuccessfully.gif?raw=true) | ![OTP Verified](https://github.com/kamesh7773/email_otp_auth/blob/main/assets/OTPVerified.gif?raw=true) | ![OTP Invalid](https://github.com/kamesh7773/email_otp_auth/blob/main/assets/OTPInvalid.gif?raw=true) | ![OTP Expired](https://github.com/kamesh7773/email_otp_auth/blob/main/assets/OTPExpired.gif?raw=true) |

--- 

## 📚 Methods

- `sendOTP({required String email})` - Sends a 6-digit OTP to the provided email address.
- `verifyOtp({required String otp})` - Verifies the provided OTP against the one sent to the email.

## 📝 Notes
- Ensure a valid email format to successfully receive OTPs.
- OTP expiration, retries, and error handling are managed within the `verifyOtp` method.

## 🔗 Devloper Info & License 

<a href="https://github.com/kamesh7773"><img src="https://avatars.githubusercontent.com/u/88535029" width="60px;" alt="kamesh Singh" style="border-radius:50%"></a>

**KAMESH SINGH**  
Flutter Developer

[![GitHub](https://img.shields.io/badge/GitHub-333?style=for-the-badge&logo=github&logoColor=white)](https://github.com/kamesh7773)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/kamesh-singh-5baab51ba/)

> Copyright © 2024 **[Kamesh Singh Sisodiya](https://github.com/kamesh7773)**. Licensed under the _[MIT LICENSE](https://github.com/kamesh7773/email_otp_auth/blob/main/LICENSE)_

---