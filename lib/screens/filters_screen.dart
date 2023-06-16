import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/widgets/filters_switch_tile.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../provider/filters_provider.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.pop(context);
          if (identifier == "meals") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TabScreen(),
              ),
            );
          }
        },
      ),
      body: const Column(
        children: [
          FiltersSwitchTile(
            filterTitle: "Gluten-Free",
            filterSubtitle: "Only include gluten free meals",
            filter: Filter.glutenFree,
          ),
          FiltersSwitchTile(
            filterTitle: "Lactose-Free",
            filterSubtitle: "Only include lactose free meals",
            filter: Filter.lactoseFree,
          ),
          FiltersSwitchTile(
            filterTitle: "Vegetarian",
            filterSubtitle: "Only include vegetarian meals",
            filter: Filter.vegetarian,
          ),
          FiltersSwitchTile(
            filterTitle: "Vegan",
            filterSubtitle: "Only include vegan meals",
            filter: Filter.vegan,
          )
        ],
      ),
    );
  }
}
