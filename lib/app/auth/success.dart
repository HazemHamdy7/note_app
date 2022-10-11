import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("  تم انشاء الحساب"),
          ),
          MaterialButton(
            minWidth: double.infinity,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("login", (route) => false);
            },
            textColor: Colors.white,
            color: Colors.teal,
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            child: const Text("تسجيل الدخول"),
          ),
        ],
      ),
    );
  }
}
