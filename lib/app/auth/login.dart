// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/constant/link_api.dart';
import 'package:noteapp/constant/valid.dart';

import '../../constant/crud.dart';
import '../../constant/customTextForm.dart';
import '../../main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Crud curd = Crud();
  bool isLoading = false;
  login() async {
    if (formstate.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response = await curd.postRequest(linkLogin, {
        "email": email.text,
        "password": password.text,
      });
      isLoading = false;
      setState(() {});
      if (response['status'] == 'success') {
        sharedPref.setString("id", response['data']['id'].toString());
        sharedPref.setString(
            "username", response['data']['username'].toString());
        sharedPref.setString("email", response['data']['email'].toString());
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      } else {
        AwesomeDialog(
                //  btnCancel: const Text("cancel"),
                context: context,
                title: "Aliart",
                body: const Text("the email or password is not valid"))
            .show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Form(
                    key: formstate,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/image/hhh.png",
                          width: 400,
                          height: 400,
                        ),
                        CustomTextForm(
                          obsText: false,
                          valid: (val) {
                            return validInput(val!, 3, 20);
                          },
                          myController: email,
                          hint: "Email",
                        ),
                        CustomTextForm(   obsText: true,
                        
                          valid: (val) {
                            
                            return validInput(val!, 6, 30);
                          },
                          myController: password,
                          hint: "Password",
                        ),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onPressed: () async {
                            await login();
                          },
                          textColor: Colors.white,
                          color: Colors.teal,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: const Text("Login"),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("signup");
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
