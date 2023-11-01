import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hotels',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      'CITYNAME',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: 500,
            child: Card(
              elevation: 0.0,
              child: Text(
                'Best Hotels in CITYNAME',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 400,
                  child: Card(
                    child: Text(
                      'HOTEL IMAGE',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: Card(
                    child: Text(
                      'HOTEL IMAGE',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: Card(
                    child: Text(
                      'HOTEL IMAGE',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
