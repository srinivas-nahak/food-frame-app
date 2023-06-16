import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({required this.onSelectScreen, super.key});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.5),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 33.sp,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.8)),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 22.sp,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18.sp),
            ),
            onTap: () {
              onSelectScreen("meals");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 22.sp,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18.sp),
            ),
            onTap: () {
              onSelectScreen("filters");
            },
          )
        ],
      ),
    );
  }
}
