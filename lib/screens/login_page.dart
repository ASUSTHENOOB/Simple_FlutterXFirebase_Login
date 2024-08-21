import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseproject1/componenes/text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  Future signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passcontroller.text.trim());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title: const Text('L O G I N'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Column(
                children: [
                  Image.asset('images/undraw_secure_login_pdn4.png'),
                  const SizedBox(height: 5),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.height * 0.5,
                        child: const Center(
                          child: Text(
                            "Welcome back You,ve been missed!!",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height *
                  0.5, // Half of the screen
              decoration: BoxDecoration(
                color: Colors.purple.shade700,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextField(
                      fieldicon: Icons.email,
                      hintName: "Email",
                      controller: emailcontroller,
                      obsecuretext: false,
                    ),
                    MyTextField(
                      fieldicon: Icons.password,
                      hintName: "Password",
                      controller: passcontroller,
                      obsecuretext: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(350, 60),
                        backgroundColor:
                            Colors.purple.shade300, // Background color
                        shadowColor: const Color.fromARGB(
                            255, 232, 232, 232), // Shadow color
                        elevation: 8, // Elevation (shadow depth)
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Rounded corners
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15), // Button padding
                      ),
                      onPressed: signin,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login,
                            color: const Color.fromARGB(255, 68, 1, 255),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "L O G I N",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 68, 1, 255),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
