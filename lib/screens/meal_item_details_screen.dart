import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favorites_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/meal.dart';

class MealItemDetailsScreen extends ConsumerWidget {
  const MealItemDetailsScreen({required this.meal, super.key});

  final Meal meal;

  void _showMessage(BuildContext context, bool favoriteStatus) {
    String message = favoriteStatus
        ? "Meal marked as favorite!!"
        : "Meal is no longer a favorite..";

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 800),
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IconData favoriteIcon = Icons.star_outline;
    Color iconColor = Theme.of(context).colorScheme.onBackground;

    ///Never perform operations inside .select() rather
    ///use the boolean value
    List<Meal> favoriteMeals = ref.watch(favoriteMealsProvider);

    if (favoriteMeals.contains(meal)) {
      favoriteIcon = Icons.star;
      iconColor = Colors.yellow;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ///We're using read instead of watch because we just need to read it onetime
              /// and not consistently.
              bool favoriteStatus = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);

              _showMessage(context, favoriteStatus);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (iconChild, animation) {
                return ScaleTransition(
                  scale: Tween<double>(begin: 0.5, end: 1).animate(animation),
                  child: iconChild,
                );
              },
              child: Icon(
                favoriteIcon,
                color: iconColor,
                key: UniqueKey(),

                ///Icon wasn't animating because of unique key problem: It's swapping the same Widget but not the state
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 2.h, bottom: 5.h),
        child: Column(children: [
          Hero(
            tag: meal.id,
            child: Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 30.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "Ingredients",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 1.h,
          ),
          for (final ingredient in meal.ingredients)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.25.h),
              child: Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "Steps",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 1.h,
          ),
          for (final steps in meal.steps)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.5.h,
                horizontal: 10.w,
              ),
              child: Text(
                steps,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            )
        ]),
      ),
    );
  }
}
