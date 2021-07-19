import 'package:flutter/material.dart';
import 'package:flutterstart/models/product.dart';

class RecentProductList extends StatefulWidget {
  const RecentProductList({Key? key}) : super(key: key);

  @override
  _RecentProductListState createState() => _RecentProductListState();
}

class _RecentProductListState extends State<RecentProductList> {
  final products = [
    Product(1, "Surface Book 3", "", 100, 56, "images/carousels/1_386.png"),
    Product(2, "Surface go 2", "", 100, 56, "images/carousels/1_388.png"),
    Product(3, "Surface laptop 4", "", 100, 56, "images/carousels/1_515.png"),
    Product(4, "Xbox Series X", "", 100, 56, "images/carousels/1_535.png"),
    Product(5, "Xbox Elite Controller 2", "Xbox Elite Controller 2", 100, 56,
        "images/carousels/2_265.png"),
    Product(6, "Surface X", "", 100, 56, "images/carousels/3_310.png"),
    Product(7, "Ear Headphones", "description", 1000, 100,
        "images/carousels/black_1.png")
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: this.products.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, index) {
          return ProductWidget(product: this.products[index]);
        });
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: this.product.name,
        child: Material(
          child: InkWell(
            onTap: () {},
            child: GridTile(
              child: Image.asset(this.product.img, fit: BoxFit.cover),
              footer: Container(
                color: Colors.white24,
                child: ListTile(
                  leading: Text(this.product.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  title: Text("\$${product.listPrice}",style: TextStyle(color: Colors.red),),
                  subtitle:Text("\$${product.price}",style: TextStyle(color: Colors.black26),) ,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
