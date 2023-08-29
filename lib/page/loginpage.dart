import 'package:flutter/material.dart';
import '../servicos/autenticacao_servico.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  AutenticacaoServico autenServico = AutenticacaoServico();
  bool versenha = false;

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
                    onPressed: () async {
                      String email = emailController.text;
                      String senha = senhaController.text;

                      if (formKey.currentState!.validate()) {
                        final mensagem = await autenServico.cadastroValido(
                          email: email,
                          senha: senha,
                        );

                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(mensagem),
                              backgroundColor: mensagem.contains("sucesso")
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          );
                          if (mensagem.contains("sucesso")) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/categorias',
                              (route) => false,
                            );
                          }
                        });
                      }
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
}
