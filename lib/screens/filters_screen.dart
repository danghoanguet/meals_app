import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);

  static const routeName = '/fliters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegertarianFree = false;
  var _veganFree = false;
  var _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten']!;
    _vegertarianFree = widget.currentFilters['vegetarian']!;
    _veganFree = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
              onPressed: () {
                final selectedFliter = {
                  'gluten': _glutenFree,
                  'vegan': _veganFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegertarianFree,
                };
                widget.saveFilters(selectedFliter);
              },
              icon: Icon(Icons.save),
            ),
          ],
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
                  _buildSwtichListTile('Vegertarian-free', _vegertarianFree,
                      'Only include Vegertarian-free meals', (val) {
                    setState(() {
                      _vegertarianFree = val;
                    });
                  }),
                  _buildSwtichListTile(
                      'Vegan-free', _veganFree, 'Only include Vegan-free meals',
                      (val) {
                    setState(() {
                      _veganFree = val;
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
