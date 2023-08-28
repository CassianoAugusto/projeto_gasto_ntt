import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> cadastrarUsuario({
    required String email,
    required String senha,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return "Cadastro realizado com sucesso";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return "O endereço de e-mail já está em uso";
      } else {
        return "Erro ao cadastrar usuário. Tente novamente mais tarde";
      }
    } catch (e) {
      return "Erro ao cadastrar usuário. Tente novamente mais tarde";
    }
  }

  Future<String> cadastroValido({
    required String email,
    required String senha,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: senha,
    );
    return "Login com sucesso";
  }
}
