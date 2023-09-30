// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:rick_morty/Pages/Complement_Screens/LogInForm.dart';

class frmLogInPage extends StatefulWidget {
  const frmLogInPage({super.key});

  @override
  State<frmLogInPage> createState() => _frmLogInPageState();
}

class _frmLogInPageState extends State<frmLogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 1, top: 0, bottom: 0, right: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 45,
                        child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Rick_and_Morty.svg/1200px-Rick_and_Morty.svg.png",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 230,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://media.cnn.com/api/v1/images/stellar/prod/230926103801-rick-morty-trailer-s7.jpg?c=16x9&q=h_720,w_1280,c_fill",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: LoginForm(),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
