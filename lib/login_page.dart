import 'package:flutter/material.dart';
import 'package:flutter_project_1/register_page.dart';
import 'home_page.dart';

//Constructor
class LoginPage extends StatefulWidget {
  //Constructor variables
  final String registeredEmail;
  final String registeredPassword;
  final String registeredName;

  //idk
  const LoginPage({
    super.key,
    required this.registeredEmail,
    required this.registeredPassword,
    required this.registeredName,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //For Password visibility toggle and also the eye icon
  bool _isPassObscured = true;

  //Variable for login status text
  var loginstatus = "Login Status";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Title texts
            const Text(
              "Welcome To The App",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const Text(
              "pls login with email and paswort",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            //Awesome image
            Center(
              child: Image.asset('assets/Slime.png', width: 100, height: 150),
            ),

            //Email input
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),

            //Password input
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextField(
                controller: _passwordController,
                //Text is shown/obscured based on _isPassObscured
                obscureText: _isPassObscured,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  //Eye icon toggle logic stuff
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        //Reverses _isPassObscured on click
                        _isPassObscured = !_isPassObscured;
                      });
                    },
                    //Change icon based on _isPassObscured
                    icon: Icon(
                      _isPassObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),
            ),

            //Login status text
            Text(loginstatus),

            //Login button 
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String email = _emailController.text;
                  String pass = _passwordController.text;
                  if (email == widget.registeredEmail && pass == widget.registeredPassword) {
                    //Login success snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Good job'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    //Change login status text
                    setState(() {
                      loginstatus = "Logging in...";
                    });
                    //Go to home page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomePage(userName: widget.registeredName),
                      ),
                    );
                  } else {
                    //Login failed snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid credentials'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    //Change login status text
                    setState(() {
                      loginstatus = "Failed to log in";
                    });
                  }
                },
                child: const Text('Login'),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterPage()),
                  );
                },
                child: const Text("Don't have an account? Register here"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
