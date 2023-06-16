import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filters_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FiltersSwitchTile extends ConsumerWidget {
  const FiltersSwitchTile(
      {required this.filterTitle,
      required this.filterSubtitle,
      required this.filter,
      super.key});

  final Filter filter;
  final String filterTitle, filterSubtitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///Here by using the .select() method
    ///we're just listening to the desired instance
    bool filterToggle = ref.watch(
      filtersProvider.select((map) => map[filter]!),
    );

    return SwitchListTile(
      title: Text(
        filterTitle,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        filterSubtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      value: filterToggle,
      onChanged: (isActive) {
        ref.read(filtersProvider.notifier).setFilter(filter, isActive);
      },
      contentPadding: EdgeInsets.only(left: 5.w, right: 7.w),
      activeColor: Theme.of(context).colorScheme.tertiary,
    );
  }
}
