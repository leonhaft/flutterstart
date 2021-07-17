import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.lightBlue,
//         child: Column(
//           children: <Widget>[
//             Icon(Icons.person),
//             Text("Michael", style: TextStyle(color: Colors.yellow)),
//             Icon(Icons.person)
//           ],
//         ));
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget carouselWidget = new Container(
      child: new CarouselSlider(
          items: <Widget>[
            Image.asset("images/carousels/1.jpg"),
            Image.asset("images/carousels/2.jpg"),
            Image.asset("images/carousels/3.jpg"),
            Image.asset("images/carousels/4.jpg")
          ],
          options: new CarouselOptions(
            height: 400,
            aspectRatio: 16 / 9,
            autoPlay: false,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          )),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
        title: Text("App"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //head
            UserAccountsDrawerHeader(
              accountName: Text("Michael"),
              accountEmail: Text("forza@outlook.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  //foregroundImage: AssetImage(),
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.blue),
            ),
            //body
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Home Page"),
                  leading: Icon(Icons.home),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My Account"),
                  leading: Icon(Icons.person),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My Orders"),
                  leading: Icon(Icons.shopping_basket),
                )),

            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Categories"),
                  leading: Icon(Icons.category),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Favorites"),
                  leading: Icon(Icons.favorite, color: Colors.red),
                )),
            Divider(),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help),
                )),
          ],
        ),
      ),
      body: new ListView(
        children: [carouselWidget],
      ),
    );
  }
}
