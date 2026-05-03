import 'package:edentist_mobile/models/login.dart';
import 'package:edentist_mobile/providers/login_provider.dart';
import 'package:edentist_mobile/screens/product_list_screen.dart';
import 'package:edentist_mobile/screens/signup_page.dart';
import 'package:edentist_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LogInProvider _logInProvider;

  @override
  Widget build(BuildContext context) {
    _logInProvider = context.read<LogInProvider>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 150,
                        width: 150,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Username",
                          prefixIcon: Icon(Icons.email),
                        ),
                        controller: _usernameController,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.password),
                        ),
                        controller: _passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var username = _usernameController.text;
                          var password = _passwordController.text;

                          print("login proceed $username $password");

                          Authorization.username = username;
                          Authorization.password = password;

                          LogIn object = LogIn(username, password);
                          try {
                            await _logInProvider.post(data: object.toJson());
                            LoggedIn.isLoggedIn=true;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const ProductListScreen(),
                              ),
                            );
                          } on Exception catch (e) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Error"),
                                content: Text("Netacan username ili password."),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text("Login"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Nemate račun?"),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          width: double.infinity,
                          child: Center(child: Text("Registruj se")),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Pregledajte proizvode"),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductListScreen(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          width: double.infinity,
                          child: Center(child: Text("Pregled proizvoda")),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
