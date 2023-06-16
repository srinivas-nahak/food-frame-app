import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_item_details_screen.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.meal, super.key});

  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //Try to use vertical and horizontal padding both instead of using .sp
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(23.sp),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              useSafeArea: true,
              isScrollControlled: true,
              context: context,
              builder: (context) => MealItemDetailsScreen(meal: meal));
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => MealItemDetailsScreen(meal: meal),
          //   ),
          // );
        },
        borderRadius: BorderRadius.circular(23.sp),
        splashColor: const Color(0xffefeeee),
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 30.h,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: "${meal.duration} min"),
                        SizedBox(
                          width: 5.w,
                        ),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        SizedBox(
                          width: 5.w,
                        ),
                        MealItemTrait(
                            icon: Icons.currency_rupee,
                            label: affordabilityText)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
