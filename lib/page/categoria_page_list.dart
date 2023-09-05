import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:projeto_gasto_ntt/page/page_editar_categoria.dart';

class CategoriaPageList extends StatefulWidget {
  const CategoriaPageList({super.key});

  @override
  State<CategoriaPageList> createState() => _CategoriaPageListState();
}

final formKey = GlobalKey<FormState>();

class _CategoriaPageListState extends State<CategoriaPageList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xFFeeeeef),
          ),
        ),
      ),
      child: Slidable(
        key: const Key(''),
        startActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                    builder: (context) => const PageEditarCategoria(),
                  );
                },
                child: Container(
                  color: const Color(0xFF5ea3a3),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Editar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  color: const Color(0xFF5ea3a3),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Deletar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        child: const ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Constas Fixas",
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "Descrição da categoria...",
                style: TextStyle(
                  color: Color(0xFF545454),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}