import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

class AutenticacaoServico {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  cadastrarUsuario({
    required String email,
    required String senha,
  }) {
    firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );
  }
// Future<void> signin(String email, String senha) async{
//   final response = await post(
//     Uri.parse(_url),
//     body: jsonEncode({
//       'emeil':email,
//       'senha':senha,
//       'returnSecureToken':true
//      })
//     );
// }
}
