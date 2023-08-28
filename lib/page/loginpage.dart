import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_gasto_ntt/page/categoriaspage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool queroEntar = true;

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;
  bool versenha = false;

  get child => null;

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: sizeHeight * 0.10),
              const Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFfaf9f9),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return "o email não pode ser vazio";
                    }
                    if (value.length < 5) {
                      return "O email é muito curto";
                    }

                    return null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Digite seu email',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFfaf9f9),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: senhaController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !versenha,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Digite sua senha',
                      suffixIcon: IconButton(
                        icon: Icon(
                          versenha
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            versenha = !versenha;
                          });
                        },
                      )),
                  validator: (String? value) {
                    if (value == null) {
                      return "Digite sua senha";
                    }
                    if (value.length < 5) {
                      return "A senha é muito curta";
                    }

                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      botaoPrincipalClicado();
                      // if (formKey.currentState!.validate()) {
                      //   Navigator.pushNamedAndRemoveUntil(
                      //     context,
                      //     '/categorias',
                      //         (route) => false,
                      //   );
                      // }
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xff5ea3a3))),
                    child: const Text(
                      'ENTRAR',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/register'),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFF5ea3a3))),
                  child: const Text(
                    'REGISTRAR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




  // login() async {
  //   try {
  //     UserCredential userCredential =
  //     await firebaseAuth.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: senhaController.text,
  //     );
  //     if (userCredential != null) {
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const CategoriasPage(),
  //           ));
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('Usuario não encontrado'),
  //       ));
  //     } else if (e.code == 'wrong-password') {
  //       const SnackBar(content: Text('Sua senha esta errada'),);
  //     }
  //   }
  // }








  botaoPrincipalClicado() {
    if (formKey.currentState!.validate()) {
      if (queroEntar) {
        print("Entrada Validada");
      } else {
        print("Cadastro validado");
        print("${emailController.text},${senhaController},");
      }
    } else {
      print("Form invalido");
    }
  }
}

