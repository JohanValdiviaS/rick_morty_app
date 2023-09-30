// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_morty/Pages/Home_Page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'Bienvenido',
            style: GoogleFonts.josefinSlab(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          // Email
          Padding(
            padding: const EdgeInsets.only(
              right: 200,
              bottom: 10,
            ),
            child: Text(
              'Correo Electronico',
              style: GoogleFonts.kaiseiOpti(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: const Color.fromRGBO(0, 89, 79, 1),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: TextFormField(
              // initialValue: 'Input text',
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Color.fromRGBO(0, 89, 79, 1),
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                hintText: 'Ingresa tu correo',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(0, 89, 79, 1),
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(0, 89, 79, 1),
                    width: 2,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por Favor Ingrese sus credenciales';
                }
                return null;
              },
              onSaved: (val) {
                email = val;
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          // Password
          Padding(
            padding: const EdgeInsets.only(
              right: 250,
              bottom: 10,
            ),
            child: Text(
              'Contraseña',
              style: GoogleFonts.kaiseiOpti(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: const Color.fromRGBO(0, 89, 79, 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Ingresa tu contraseña',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Color.fromRGBO(0, 89, 79, 1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(0, 89, 79, 1),
                    width: 2,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(0, 89, 79, 1),
                    width: 2,
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        _obscureText = !_obscureText;
                      },
                    );
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color.fromARGB(255, 0, 129, 114),
                  ),
                ),
              ),
              obscureText: _obscureText,
              onSaved: (val) {
                password = val;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por Favor Ingrese sus credenciales';
                }
                return null;
              },
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 54,
            width: 184,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                backgroundColor: const Color.fromRGBO(0, 89, 79, 1),
              ),
              child: Text(
                'Iniciar Sesión',
                style: GoogleFonts.josefinSlab(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
