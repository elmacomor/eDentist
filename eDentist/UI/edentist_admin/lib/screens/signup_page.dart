import 'package:eprodaja_admin/models/user.dart';
import 'package:eprodaja_admin/providers/user_provider.dart';
import 'package:eprodaja_admin/screens/pregled_zaposlenika.dart';
import 'package:eprodaja_admin/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  late UserProvider _korisniciProvider;

  @override
  Widget build(BuildContext context) {
    _korisniciProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Dodaj zaposlenika",
              style: TextStyle(fontSize: 18, color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 600, maxWidth: 400),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 150,
                        width: 300,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "First Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                        controller: _firstnameController,
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Last Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                        controller: _lastnameController,
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Username",
                          prefixIcon: Icon(Icons.account_circle),
                        ),
                        controller: _usernameController,
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                        controller: _emailController,
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Address",
                          prefixIcon: Icon(Icons.location_on),
                        ),
                        controller: _addressController,
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                        controller: _passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                        controller: _confirmPasswordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () async {
                          if (_firstnameController.text.isEmpty ||
                              _lastnameController.text.isEmpty ||
                              _emailController.text.isEmpty ||
                              _addressController.text.isEmpty ||
                              _usernameController.text.isEmpty ||
                              _passwordController.text.isEmpty ||
                              _confirmPasswordController.text.isEmpty ||
                              _confirmPasswordController.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Error"),
                                content: const Text("Sva polja su obavezna!"),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("OK")),
                                ],
                              ),
                            );
                          } else if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Error"),
                                content: const Text(
                                    "Passwordi se trebaju poklapati."),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("OK")),
                                ],
                              ),
                            );
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(_emailController.text)) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Error"),
                                content: const Text("Netacan format e-maila."),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("OK")),
                                ],
                              ),
                            );
                          } else {
                            var request = new User(
                                0,
                                1,
                                _firstnameController.text,
                                _lastnameController.text,
                                _emailController.text,
                                _usernameController.text,
                                _addressController.text,
                                1,
                                null,
                                _passwordController.text,
                                _confirmPasswordController.text);

                            var x = await _korisniciProvider.insert(request);
                            print(x);
                            if (x != null) {
                              Authorization.username = _usernameController.text;
                              Authorization.password = _passwordController.text;

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => PregedZaposlenika()),
                              );
                            }
                          }
                        },
                        child: const Center(
                            child: Text("Dodaj zaposlenika",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
