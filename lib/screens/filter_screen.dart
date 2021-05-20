import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FilterScreen(this.saveFilters,this.currentFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactose = false;
  

  Widget _buildSwitchListTile(
      String title, String subtitle, var currentValue, Function updateValue) {
    return SwitchListTile(
        value: currentValue,
        title: Text(title),
        subtitle: Text(subtitle),
        onChanged: updateValue);
  }
  @override
  void initState() {
     _glutenFree = widget.currentFilter['gluten'];
   _vegetarian = widget.currentFilter['vegetarian'];
   _vegan = widget.currentFilter['vegan'];
   _lactose = widget.currentFilter['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _vegetarian,
                  'vegan': _vegan,
                  'vegetarian': _lactose,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adust',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile('Gluten', 'Only for Guluteen', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile('Lactose', 'Only for Lactose', _lactose,
                  (newValue) {
                setState(() {
                  _lactose = newValue;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only for Vegan', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
