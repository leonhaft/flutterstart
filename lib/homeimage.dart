import "package:flutter/material.dart";

class HomeImagePage extends StatefulWidget {
  const HomeImagePage({Key? key}) : super(key: key);

  @override
  _HomeImagePageState createState() => _HomeImagePageState();
}

class _HomeImagePageState extends State<HomeImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Load local image"),
        ),
        body: Container(
          child: Center(
            child: Text(
              "Hello World!",
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Set the image as the background of the Container
          decoration: BoxDecoration(
              image: DecorationImage(
                  // Load image from assets
                  image: AssetImage('images/carousels/1.jpg'),
                  // Make the image cover the whole area
                  fit: BoxFit.cover)),
        ));
  }
}
