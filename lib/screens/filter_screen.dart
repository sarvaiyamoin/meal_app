import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter-screen";
  final Function setFilters;
  final Map<String, bool> currentFilter;
  const FilterScreen(this.currentFilter, this.setFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;
  @override
  void initState() {
    _glutenfree = widget.currentFilter['gluten'];
    _lactosefree = widget.currentFilter['lactose'];
    _vegan = widget.currentFilter['vegan'];
    _vegetarian = widget.currentFilter['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchTile(
      bool currentValue, Function updateValue, String title, String subtitle) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFiltes = {
                  'gluten': _glutenfree,
                  'lactose': _lactosefree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.setFilters(selectedFiltes);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: Text("Adjust your meal selection.",
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(_glutenfree, (newValue) {
                  setState(() {
                    _glutenfree = newValue;
                  });
                }, "Glutten - Free", "Only include glutten - free meals."),
                _buildSwitchTile(_lactosefree, (newValue) {
                  setState(() {
                    _lactosefree = newValue;
                  });
                }, "Lactose - Free", "Only include Lactose free meals."),
                _buildSwitchTile(_vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }, "Vegetarian", "Only include Vegetarian meals."),
                _buildSwitchTile(_vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }, "Vegan", "Only include Vegan meals."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
