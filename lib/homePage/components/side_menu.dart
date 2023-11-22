import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';
import 'package:suggesta/pages/login_page.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      child: Drawer(
        backgroundColor: Colors.white,
        width: MediaQuery.of(context).size.width / 1.5,
        child: ListView(
          shrinkWrap: true,
          children: [
            DrawerListTile(
              icon: TernavIcons.lightOutline.profile,
              title: "Profile",
              onTap: () {},
            ),
            DrawerListTile(
              icon: TernavIcons.lightOutline.menu,
              title: "My Topics",
              onTap: () {},
            ),
            DrawerListTile(
              icon: TernavIcons.lightOutline.folder,
              title: "Categories",
              onTap: () {},
            ),
            DrawerListTile(
              icon: TernavIcons.lightOutline.settings,
              title: "Settings",
              onTap: () {},
            ),
            DrawerListTile(
              icon: TernavIcons.lightOutline.logout,
              title: "Log out",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const login_page()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Color.fromARGB(255, 99, 99, 99),
        size: 23,
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Color.fromARGB(255, 46, 46, 46), fontSize: 17),
      ),
    );
  }
}
