import 'package:firebase/services/auth_service.dart';
import 'package:firebase/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Email", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "password", border: OutlineInputBorder()),
            ),
            TextField(
              obscureText: true,
              controller: confirmpasswordController,
              decoration: InputDecoration(
                  labelText: "Confirm password", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () async {
                    if (emailController.text == "" ||
                        passwordController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("All field are required"),
                        backgroundColor: Colors.red,
                      ));
                    } else if (passwordController.text !=
                        confirmpasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Password don not match"),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      User? result = await Authservice().register(
                          emailController.text, passwordController.text,context);
                      if (result != null) {
                        print("succes");
                        print(result.email);
                      }
                    }
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text("Alredy have account? Login here"))
          ],
        ),
      ),
    );
  }
}
