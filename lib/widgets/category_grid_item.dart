import 'package:flutter/material.dart';
import 'package:meals_app/models/categories.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {required this.categories, required this.onPress, super.key});

  final Categories categories;
  final VoidCallback
      onPress; // Alternate declaration   //final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Material(
        color: categories.color,
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          onTap: onPress,
          splashColor: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              categories.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
        ),
      ),
    );
  }
}
