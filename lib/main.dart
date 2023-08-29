import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gasto_ntt/page/categoriapagelist.dart';
import 'package:projeto_gasto_ntt/page/categoriaspage.dart';
import 'package:projeto_gasto_ntt/page/loginpage.dart';
import 'package:projeto_gasto_ntt/page/registropage.dart';

import 'servicos/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meus Gasto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/splash': (context) => const MyApp(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/categorias': (context) => const CategoriasPage(),
        '/categoriapagelist': (context) => const CategoriaPageList(),
      },
    );
  }
}
