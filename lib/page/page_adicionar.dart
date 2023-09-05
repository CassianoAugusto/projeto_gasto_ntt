import 'package:flutter/material.dart';

class PageAdicionar extends StatefulWidget {
  const PageAdicionar({super.key});

  @override
  State<PageAdicionar> createState() => _PageAdicionarState();
}

class _PageAdicionarState extends State<PageAdicionar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height*0.9,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Adicionar Categoria',
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
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
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
                        hintText: 'ex: Casa',
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
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
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
                      hintText: 'ex:Gastos relacionados a moradia...',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/homepage',
                    (route) => false,
                  ),
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
    );
  }
}
