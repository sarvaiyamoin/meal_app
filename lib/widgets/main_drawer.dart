import 'package:flutter/material.dart';
import 'package:meal_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildLisTile(IconData icon, String title, Function selecedScreen) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 26,
            fontWeight: FontWeight.bold),
      ),
      onTap: selecedScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 150,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 26,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildLisTile(
            Icons.restaurant,
            "Meals",
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildLisTile(Icons.settings, "Filters", () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}
