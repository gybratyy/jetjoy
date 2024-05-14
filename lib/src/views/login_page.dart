import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/authentication_bloc.dart';
import 'register_page.dart';
import 'main_page.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthenticationBloc, AuthenticationStatus>(
          listener: (context, state) {
            if (state == AuthenticationStatus.authenticated) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
            } else if (state == AuthenticationStatus.authenticationError) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid credentials')));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Retrieve email and password from TextControllers
                    String email = emailController.text;
                    String password = passwordController.text;

                    // Trigger the login event in the bloc
                    context.read<AuthenticationBloc>().triggerLogin(email, password);
                  },
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage())),
                  child: const Text('Register new account'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}