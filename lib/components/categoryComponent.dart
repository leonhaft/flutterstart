import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryWidget(
              category: Category("images/cats/tshirt.png", "tshirt", "tshirt")),
          CategoryWidget(
              category: Category("images/cats/shoe.png", "shoe", "shoe")),
          CategoryWidget(
              category: Category("images/cats/jeans.png", "jeans", "jeans")),
          CategoryWidget(
              category: Category("images/cats/informal.png", "informal", "informal")),
          CategoryWidget(
              category: Category("images/cats/formal.png", "formal", "formal")),
          CategoryWidget(
              category: Category("images/cats/dress.png", "dress", "dress")),
          CategoryWidget(
              category: Category("images/cats/accessories.png", "accessories", "accessories")),
        ],
      ),
    );
  }
}

class Category {
  final String icon;
  final String title;
  final String caption;

  Category(this.icon, this.title, this.caption);
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(this.category.icon, width: 100.0, height: 80.0),
            subtitle: Container(child: Text(this.category.caption),alignment: Alignment.topCenter),
          ),
        ),
      ),
    );
  }
}
