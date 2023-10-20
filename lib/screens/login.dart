import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _globalKey = GlobalKey<FormState>();

  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: const Size.fromHeight(100).height,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextFormField(
                  controller: emailAddress,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    //suffixIcon: _buildShowPasswordIcon(),
                    label: Text('E-mail'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextFormField(
                  controller: password,
                  obscureText: isPasswordHidden,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: const Text("Password"),
                    suffixIcon: IconButton(
                      onPressed: _togglePasswordVisibility,
                      icon: _getTogglePasswordVisibilityIcon(),
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: null,
                icon: const Icon(Icons.login),
                label: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns icon used as template to illustrate our show/hide
  /// password toggle button - the one besides password input
  Icon _getTogglePasswordVisibilityIcon() => isPasswordHidden
      ? const Icon(Icons.remove_red_eye)
      : const Icon(Icons.disabled_visible);

  /// Set password visibility when invoked on TogglePasswordVisibilityButton
  void _togglePasswordVisibility() =>
      setState(() => isPasswordHidden = !isPasswordHidden);
}
