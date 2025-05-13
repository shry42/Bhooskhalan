import 'package:bhooskhalan/screens/login_register_pages/login_register_screen.dart';
import 'package:bhooskhalan/screens/public_login_screens/public_login_screen.dart';
import 'package:bhooskhalan/screens/register_screens/public/public_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterFormPublic extends StatefulWidget {
  const RegisterFormPublic({super.key});

  @override
  State<RegisterFormPublic> createState() => _RegisterFormPublicState();
}

class _RegisterFormPublicState extends State<RegisterFormPublic> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final _inputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.grey.shade200,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
  );

@override
  void initState() {
    super.initState();
    // Delay so the dialog doesn't show before build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showPublicInfoDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

      SizedBox(height: 80),
     
      Image.asset('assets/logo.png', height: 120,width: 350,),  // const SizedBox(height: 20), // optional: add slight spacing between logo and text
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _boldChar("B"),
          _boldChar("H"),
          _circleImage('assets/india_map.png'),
          _circleImage('assets/globe_asia.png'),
          _boldChar("S"),
          _boldChar("K"),
          _boldChar("H"),
          _dotText("A"),
          _landslideText("L"),
          _landslideText("A"),
          _boldChar("N"),
        ],
      ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                const Text(
                  "Register as Public",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 32),
          
                // Username
                TextField(
                  decoration: _inputDecoration.copyWith(hintText: 'Username'),
                ),
                const SizedBox(height: 16),
          
                // Email
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration.copyWith(hintText: 'Email ID'),
                ),
                const SizedBox(height: 16),
          
                // Mobile
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: _inputDecoration.copyWith(hintText: 'Mobile number'),
                ),
                const SizedBox(height: 16),
          
                // Password
                TextField(
                  obscureText: _obscurePassword,
                  decoration: _inputDecoration.copyWith(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
          
                // Confirm Password
                TextField(
                  obscureText: _obscureConfirmPassword,
                  decoration: _inputDecoration.copyWith(
                    hintText: 'Confirm password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
          
                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Register logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
          
                const SizedBox(height: 16),
          
                // Login redirect
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a user? "),
                    GestureDetector(
                      onTap: () {
                        // Navigate to login
                        Get.to(()=>PublicLoginScreen());
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


  Widget _boldChar(String char) {
    return Text(
      char,
      style: const TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
    );
  }

Widget _circleImage(String assetPath) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2),
    child: Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1), // thin black border
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

  Widget _dotText(String char) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        _boldChar(char),
        const Positioned(
          right: 0,
          child: Text(
            ".",
            style: TextStyle(fontSize: 10, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _landslideText(String char) {
    return Text(
      char,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.brown),
        ],
      ),
    );
  }
