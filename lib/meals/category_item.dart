import 'package:flutter/material.dart';

import 'category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({Key? key, required this.title, required this.color})
      : super(key: key);

  navigate(BuildContext ctx, String title) {
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return MealsScreen();
    // }));
    Navigator.of(ctx)
        .pushNamed(MealsScreen.routeName, arguments: {'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {navigate(context, title)},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(.7), color]),
        ),
      ),
    );
  }
}
