import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_gasto_ntt/page/categoria_page_list.dart';
import 'package:projeto_gasto_ntt/page/entry_page.dart';
import 'package:projeto_gasto_ntt/page/page_adicionar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final formKey = GlobalKey<FormState>();

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

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
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: true,
                  builder: (context) => const PageAdicionar(),
                );
              },
              icon: const Icon(
                Icons.add_circle_outline,
                color: (Color(0xFF5ea3a3)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },

        // indicatorColor:(const Color(0xff5ea3a3)),
        destinations: <Widget>[
          NavigationDestination(
            icon: SvgPicture.asset(
              'asset/icons/entry.svg',
              width: 16,
              height: 16,
              color: selectedIndex == 1 ? Colors.grey : Colors.green,
            ),
            label: 'Lançamentos',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'asset/icons/category.svg',
              width: 16,
              height: 16,
              color: selectedIndex == 0 ? Colors.grey : Colors.green,
            ),
            label: 'Categorias',
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              selectedIndex == 1 ? 'Categorias' : 'Lançamentos',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          selectedIndex == 1 ? const CategoriaPageList() : const EntryPage(),
        ],
      ),
    );
  }
}
