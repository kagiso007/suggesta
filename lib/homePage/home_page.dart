import '../widgets/categories_grid.dart';
import 'package:flutter/material.dart';
import '../homePage/components/side_menu.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 17, 17, 17)),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/appLogo.png'),
                radius: 20,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2)),
              Text('TRENDING',
                  style: TextStyle(
                      color: Color.fromARGB(255, 45, 45, 45), fontSize: 18)),
            ],
          )),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [],
              ),
              const SizedBox(
                height: 10,
              ),
              const CategoriesGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
