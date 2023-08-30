import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gasto_ntt/page/categoria_page_list.dart';
import 'package:projeto_gasto_ntt/page/home_page.dart';
import 'package:projeto_gasto_ntt/page/page_adicionar.dart';
import 'package:projeto_gasto_ntt/page/login_page.dart';
import 'package:projeto_gasto_ntt/page/page_editar_categoria.dart';
import 'package:projeto_gasto_ntt/page/registro_page.dart';

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
        '/homepage': (context) => const HomePage(),
        '/categoriapagelist': (context) => const CategoriaPageList(),
        '/pageadicionar': (context) => const PageAdicionar(),
        '/pageeditarcategoria': (context)=> const PageEditarCategoria(),
      },
    );
  }
}
