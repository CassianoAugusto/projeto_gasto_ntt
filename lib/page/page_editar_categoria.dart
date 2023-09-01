import 'package:flutter/material.dart';

import 'categoria_page_list.dart';

class PageEditarCategoria extends StatefulWidget {
  const PageEditarCategoria({super.key});

  @override
  State<PageEditarCategoria> createState() => _PageEditarCategoriaState();
}

class _PageEditarCategoriaState extends State<PageEditarCategoria> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: sizeHeight * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: sizeHeight * 0.10),
                    const Text(
                      'Editar Categoria',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Title(
                        color: Colors.black,
                        child: const Text(
                          'Nome da categoria',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        )),
                    SizedBox(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFfaf9f9),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Contas Fixas',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Title(
                        color: Colors.black,
                        child: const Text(
                          'Descrição da categoria',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        )),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFfaf9f9),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Gastos que tenho todo mês',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(Color(
                            0xFF5ea3a3,
                          ))),
                      child: const Text(
                        'SALVAR',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>  Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/homepage',
                            (route) => false,
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
      ),
    );
  }
}
