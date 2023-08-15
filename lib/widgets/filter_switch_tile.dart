import 'package:flutter/material.dart';

class FilterSwitchTile extends StatefulWidget {
  const FilterSwitchTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.subtitle,
  });

  final bool value;
  final Function(bool) onChanged;
  final String title;
  final String subtitle;

  @override
  State<FilterSwitchTile> createState() => _FilterSwitchTileState();
}

class _FilterSwitchTileState extends State<FilterSwitchTile> {
  late bool _isChecked = widget.value;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _isChecked,
      onChanged: (newValue) {
        setState(() {
          _isChecked = newValue;
        });
        widget.onChanged(newValue);
      },
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
    );
  }
}
