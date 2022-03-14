import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  static const routeName = '/fliters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegertarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Your Filters'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwtichListTile('Gluten-free', _glutenFree,
                      'Only include Gluten-free meals', (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  }),
                  _buildSwtichListTile('Vegertarian-free', _vegertarian,
                      'Only include Vegertarian-free meals', (val) {
                    setState(() {
                      _vegertarian = val;
                    });
                  }),
                  _buildSwtichListTile(
                      'Vegan-free', _vegan, 'Only include Vegan-free meals',
                      (val) {
                    setState(() {
                      _vegan = val;
                    });
                  }),
                  _buildSwtichListTile('LactoseFree-free', _lactoseFree,
                      'Only include LactoseFree-free meals', (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }

  SwitchListTile _buildSwtichListTile(
      String title, bool value, String subtitle, Function onChange) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: (val) => onChange(val),
      subtitle: Text(subtitle),
    );
  }
}
