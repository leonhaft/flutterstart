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
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final imgList = [
    'images/carousels/1_386.png',
    'images/carousels/1_388.png',
    'images/carousels/1_515.png',
    'images/carousels/1_535.png',
    'images/carousels/2_265.png',
    'images/carousels/3_310.png',
    'images/carousels/black_1.png'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(item, fit: BoxFit.cover, width: 700.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${imgList.indexOf(item)} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    final items = <Widget>[
      Image.asset("images/carousels/1_386.png"),
      Image.asset("images/carousels/1_388.png"),
      Image.asset("images/carousels/1_515.png"),
      Image.asset("images/carousels/1_535.png"),
      Image.asset("images/carousels/2_265.png"),
      Image.asset("images/carousels/3_310.png"),
      Image.asset("images/carousels/black_1.png")
    ];

    Widget carouselWidget = new Container(
      child: new CarouselSlider(
          items: imageSliders,
          options: new CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              autoPlay: false,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, item) {
                setState(() {
                  _current = index;
                });
              })),
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
        children: [
          carouselWidget,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
