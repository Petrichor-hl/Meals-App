import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_switch_tile.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FiltersScreen> {
  late bool _galutenFreeFilterSet = widget.currentFilters['glutenFree']!;
  late bool _lactoseFreeFilterSet = widget.currentFilters['lactoseFree']!;
  late bool _vegetarianFilterSet = widget.currentFilters['vegetarian']!;
  late bool _veganFilterSet = widget.currentFilters['vegan']!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            'glutenFree': _galutenFreeFilterSet,
            'lactoseFree': _lactoseFreeFilterSet,
            'vegetarian': _vegetarianFilterSet,
            'vegan': _veganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            FilterSwitchTile(
                value: _galutenFreeFilterSet,
                onChanged: (isChecked) => _galutenFreeFilterSet = isChecked,
                title: 'Gluten-free',
                subtitle: 'Only include gluten-free meals'),
            FilterSwitchTile(
                value: _lactoseFreeFilterSet,
                onChanged: (isChecked) => _lactoseFreeFilterSet = isChecked,
                title: 'Lactose-free',
                subtitle: 'Only include lactose-free meals'),
            FilterSwitchTile(
                value: _vegetarianFilterSet,
                onChanged: (isChecked) => _vegetarianFilterSet = isChecked,
                title: 'Vegetarian',
                subtitle: 'Only include vegetarian meals'),
            FilterSwitchTile(
                value: _veganFilterSet,
                onChanged: (isChecked) => _veganFilterSet = isChecked,
                title: 'Vegan',
                subtitle: 'Only include vegan meals'),
          ],
        ),
      ),
    );
  }
}
