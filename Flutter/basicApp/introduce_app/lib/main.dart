import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Thao Nguyen",
    home: Lake(),
  ));
}

class Lake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "Lake Campground",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Kandersteg, Switzerland",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text("41"),
        ],
      ),
    );

    Color colorIcon = Colors.blue[500];

    Widget buttonSection = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton(colorIcon, Icons.call, 'CALL'),
          _buildButton(colorIcon, Icons.near_me, 'ROUTE'),
          _buildButton(colorIcon, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
        padding: EdgeInsets.all(8),
        child: Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
          softWrap: true,
        ));

    final mainImage = Image.asset(
      'images/lake.jpg',
      fit: BoxFit.cover,
    );

    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Thao Nguyen"),
        // ),
        body: Center(
            child: Column(
      children: [
        mainImage,
        titleSection,
        buttonSection,
        textSection,
      ],
    )));
  }

  Column _buildButton(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          label,
          style: TextStyle(color: color, fontFamily: 'Roboto', fontSize: 12),
        ),
      ],
    );
  }
}
