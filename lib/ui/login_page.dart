import 'package:crud_bendera/bloc/profil_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc/login_bloc.dart';
import '../data/model/login_model.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool isSecured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: emailC,
                decoration: InputDecoration(
                  focusColor: Colors.brown[300],
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    size: 28,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Enter Your Email',
                  labelStyle: TextStyle(
                      color: Colors.grey[400], fontWeight: FontWeight.w400),
                  prefixIconColor: Colors.brown[300],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordC,
                obscureText: isSecured,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSecured = !isSecured;
                        });
                      },
                      child: Icon(
                          isSecured ? Icons.visibility_off : Icons.visibility)),
                  focusColor: Colors.brown[300],
                  prefixIcon: const Icon(
                    Icons.key,
                    size: 28,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Enter Your Password',
                  labelStyle: TextStyle(
                      color: Colors.grey[400], fontWeight: FontWeight.w400),
                  prefixIconColor: Colors.brown[300],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    context.read<ProfileBloc>().add(OnProfileEvent());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Login success"),
                      ),
                    );
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Login failed"),
                      ),
                    );
                  }
                },
                child: ElevatedButton(
                    onPressed: () {
                      final requestModel = LoginModel(
                        email: emailC.text,
                        password: passwordC.text,
                      );

                      context.read<LoginBloc>().add(OnLoginEvent(requestModel));
                    },
                    child: const Text('Login')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
