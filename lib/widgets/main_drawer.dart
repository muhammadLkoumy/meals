import 'package:flutter/material.dart';
import 'package:meals/screens/filters_screen.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget buildListTile(String txt, IconData icon, Function onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        txt,
        style: const TextStyle(fontSize: 20),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: (){
        onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Container(
                width: double.infinity,
                color: Colors.amber,
                alignment: Alignment.center,
                child: Text(
                  'Meals',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).primaryColor, fontSize: 22),
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          buildListTile('Meals', Icons.restaurant, (){
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.pushReplacementNamed(
                context, FiltersScreen.filtersScreen);
          }),
        ],
      ),
    );
  }
}
