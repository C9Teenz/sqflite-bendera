import 'package:crud_bendera/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_bloc/register_bloc.dart';
import '../data/model/register_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameC = TextEditingController();
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
                "Register",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: nameC,
                decoration: InputDecoration(
                  focusColor: Colors.brown[300],
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    size: 28,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Enter Your Name',
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
              BlocListener<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Register Success")));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  }
                },
                child: ElevatedButton(
                    onPressed: () {
                      final requestModel = RegisterModel(
                        name: nameC.text,
                        email: emailC.text,
                        password: passwordC.text,
                      );

                      context
                          .read<RegisterBloc>()
                          .add(OnRegisterEvent(requestModel));
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text('Register')),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                )),
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
