import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/filter_switch_tile.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allFilter = ref.read(filtersProvider);
    bool glutenFreeFilterSet = allFilter['glutenFree']!;
    bool lactoseFreeFilterSet = allFilter['lactoseFree']!;
    bool vegetarianFilterSet = allFilter['vegetarian']!;
    bool veganFilterSet = allFilter['vegan']!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilter({
            'glutenFree': glutenFreeFilterSet,
            'lactoseFree': lactoseFreeFilterSet,
            'vegetarian': vegetarianFilterSet,
            'vegan': veganFilterSet,
          });
          return true;
        },
        child: Column(
          children: [
            FilterSwitchTile(
                value: glutenFreeFilterSet,
                onChanged: (isChecked) => glutenFreeFilterSet = isChecked,
                title: 'Gluten-free',
                subtitle: 'Only include gluten-free meals'),
            FilterSwitchTile(
                value: lactoseFreeFilterSet,
                onChanged: (isChecked) => lactoseFreeFilterSet = isChecked,
                title: 'Lactose-free',
                subtitle: 'Only include lactose-free meals'),
            FilterSwitchTile(
                value: vegetarianFilterSet,
                onChanged: (isChecked) => vegetarianFilterSet = isChecked,
                title: 'Vegetarian',
                subtitle: 'Only include vegetarian meals'),
            FilterSwitchTile(
                value: veganFilterSet,
                onChanged: (isChecked) => veganFilterSet = isChecked,
                title: 'Vegan',
                subtitle: 'Only include vegan meals'),
          ],
        ),
      ),
    );
  }
}
