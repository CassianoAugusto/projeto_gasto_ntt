import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gasto_ntt/page/loginpage.dart';
import 'package:projeto_gasto_ntt/servicos/autenticacao_servico.dart';
// Import the generated file

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

bool queroEntar = true;

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final nome = TextEditingController();
  AutenticacaoServico autenServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: sizeHeight * 0.10),
                const Text(
                  'Registar',
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
                      hintText: 'Endereço de email',
                    ),
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
                    controller: senhaController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Crie sua senha',
                    ),
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
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Confirme sua senha',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    String email = emailController.text;
                    String senha = senhaController.text;
                    if (formKey.currentState!.validate()) {
                      if (queroEntar) {
                        print("Entrada Validada");
                      } else {
                        print("Cadastro validado");
                        print("${emailController.text},${senhaController},");
                        autenServico.cadastrarUsuario(
                            email: email, senha: senha);
                      }
                    } else {
                      print("Form invalido");
                    }
                  },
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
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFF5ea3a3))),
                  child: const Text(
                    'CANCELAR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //
  // botaoPrincipalClicado() {
  //   String email = emailController.text;
  //   String senha = senhaController.text;
  //   if (formKey.currentState!.validate()) {
  //     if (queroEntar) {
  //       print("Entrada Validada");
  //     } else {
  //       print("Cadastro validado");
  //       print("${emailController.text},${senhaController},");
  //       autenServico.cadastrarUsuario(email: email, senha: senha);
  //     }
  //   } else {
  //     print("Form invalido");
  //   }
  // }
}
