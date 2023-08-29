import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CategoriaPageList extends StatefulWidget {
  const CategoriaPageList({super.key});

  @override
  State<CategoriaPageList> createState() => _CategoriaPageListState();
}

final formKey = GlobalKey<FormState>();

class _CategoriaPageListState extends State<CategoriaPageList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width *0.8,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xFFeeeeef),
            ),
          ),
        ),
        child: Slidable(
          key: const ValueKey(0),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.30,
            children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: const Color(0xFF5ea3a3),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Editar',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.30,
            children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: const Color(0xFF5ea3a3),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Deletar',
              ),
            ],
          ),
          child: const Column(
            children: [
              Text(
                'data                  fd',
                style: TextStyle(fontSize: 20),
              ),
              Text(

                'subi                fdfd',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
