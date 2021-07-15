import "package:flutter/material.dart";

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
    return Container(
        color: Colors.lightBlue,
        child: Column(
          children: <Widget>[
            Icon(Icons.person),
            Text("Michael stateful", style: TextStyle(color: Colors.yellow)),
            Icon(Icons.person)
          ],
        ));
  }
}
