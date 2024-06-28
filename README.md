## Description

Email Otp Auth is a Flutter package that provides email verification via OTP (One-Time Password). This package includes two primary methods: `sendOtp` and `verifyOtp`. The `sendOtp` method sends an OTP to the specified email address, while the `verifyOtp` method verifies the OTP by matching it with the one that was sent via the `sendOtp` method.

## Installation

To use this package in your Flutter project, add the following import statement:

```dart
import 'package:email_otp_auth/email_otp_auth.dart';
```

## Usage

### Sending OTP

Use the `sendOtp` method to send an OTP to an email address.

```dart
EmailOtpAuth.sendOTP(email: emailController.text);
```

### Verifying OTP

Use the `verifyOtp` method to verify the OTP sent to the email address.

```dart
EmailOtpAuth.verifyOtp(otp: otpController.text);
```

## Features

- Send OTP to any email address.
- Verify OTP sent to an email address.

## Example

👉 For a complete example, refer to the [Email OTP Auth package](https://pub.dev/packages/email_otp_auth).

## Report bugs or issues

You are welcome to open a _[ticket](https://github.com/kamesh7773/email_otp_auth/issues)_ on github if any 🐞 problems arise. New ideas are always welcome.

## Contributors

<a href="https://github.com/kamesh7773"><img src="https://avatars.githubusercontent.com/u/88535029" width="60px;" alt="kamesh Singh" style="border-radius:50%"><br/><sub><b>kamesh7773</b></sub></a>

> Copyright © 2024 **[Kamesh Singh Sisodiya](https://github.com/kamesh7773)**. Licensed under the _[MIT LICENSE](https://github.com/kamesh7773/email_otp_auth/blob/main/LICENSE)_