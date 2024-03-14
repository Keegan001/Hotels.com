import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String CITYNAME = 'Mumbai';
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Hotels',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   elevation: 0.0,
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
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
                      '$CITYNAME',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 400,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset('assets/oberoihotel.png'),
                        Text(
                          '\nThe Oberoi Mumbai',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: Card(
                      child: Column(
                    children: [
                      Image.asset('assets/intercontinental.png'),
                      Text(
                        '\nIntercontinental Marine Drive Mumbai',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
                ),
                SizedBox(
                  width: 400,
                  child: Card(
                      child: Column(
                    children: [
                      Image.asset('assets/taj.png'),
                      Text(
                        '\nThe Taj Mahal Tower',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
