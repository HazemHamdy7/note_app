import 'package:flutter/material.dart';
import 'package:noteapp/constant/crud.dart';
import 'package:noteapp/constant/link_api.dart';
import 'package:noteapp/constant/valid.dart';

import '../../constant/customTextForm.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formstate = GlobalKey();
  Crud crud = Crud();
  bool isLoading = false;

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  signUp() async {
    if (formstate.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response = await crud.postRequest(linkSignUp, {
        "username": username.text,
        "email": email.text,
        "password": password.text,
      });
     
     
     // isLoading = false;
      setState(() {});
      if (response['status'] == "success") {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("login", (route) => false);
      } else {
        print("signUp fail");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  Form(
                    key: formstate,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/image/hhh.png",
                          width: 250,
                          height: 250,
                        ),
                        CustomTextForm(
                          obsText: false,
                          valid: (val) {
                            return validInput(val!, 3, 30);
                          },
                          myController: username,
                          hint: "UserName",
                        ),
                        CustomTextForm(
                          obsText: false,
                          valid: (val) {
                            return validInput(val!, 3, 30);
                          },
                          myController: email,
                          hint: "Email",
                        ),
                        CustomTextForm(
                          obsText: true,
                          valid: (val) {
                            return validInput(val!, 6, 15);
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
                            await signUp();
                          },
                          textColor: Colors.white,
                          color: Colors.teal,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: const Text("SignUp"),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed("login");
                            },
                            child: const Text(
                              "Login",
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
