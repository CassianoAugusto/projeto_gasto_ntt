import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_gasto_ntt/page/categoriapagelist.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({super.key});

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

final formKey = GlobalKey<FormState>();


class _CategoriasPageState extends State<CategoriasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text(
                "Logout",
                style: TextStyle(
                    color: Color(0xFF5ea3a3),
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle_outline,
                color: (Color(0xFF5ea3a3)),
              ),
            ),
          ],
        ),
      ),

      body: const SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categorias',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
      CategoriaPageList(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {});
        },
        // indicatorColor:(const Color(0xff5ea3a3)),
        destinations: <Widget>[
          NavigationDestination(
            icon: SvgPicture.asset(
              'asset/icons/entry.svg',
              width: 16,
              height: 16,
            ),
            label: 'Lançamentos',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'asset/icons/category.svg',
              width: 16,
              height: 16,
            ),
            label: 'Categorias',
          ),
        ],
      ),
    );
  }
}
