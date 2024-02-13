import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:heal_tether/homepage.dart';
import 'package:heal_tether/validate_store.dart';

class Validation extends StatelessWidget {
  final ValidateStore validateStore = ValidateStore();

  Validation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 83, 22, 226),
        title: const Text(
          "User Details",
          style: TextStyle(color: Color.fromARGB(255, 228, 230, 230)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Observer(
            builder: (_) => Form(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/home_screen.png",
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: validateStore.setName,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        hintText: "Enter Your Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (_) => validateStore.nameError,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: validateStore.setEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "E-Mail",
                        hintText: "Enter Your E-Mail",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.mail),
                      ),
                      validator: (_) => validateStore.emailError,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      onChanged: validateStore.setPassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: validateStore.passwordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Your Password",
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: validateStore.togglePasswordVisibility,
                          child: validateStore.passwordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                      validator: (_) => validateStore.passwordError,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: validateStore.isFormValid
                            ? () {
                                validateStore.submit();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              }
                            : null,
                        child: const Text("Log In"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
