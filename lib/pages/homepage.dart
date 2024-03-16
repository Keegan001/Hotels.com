import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app1/Models/search_model.dart';
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
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                ),
                Text(
                  '$CITYNAME',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 350,
            child: FutureBuilder<HotelData>(
              future: fetchHotels('304554'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  final hotelData = snapshot.data!;
                  final hotels = hotelData.results?.data ?? [];

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      final hotel = hotels[index];
                      return SizedBox(
                        height: 250,
                        width: 350,
                        child: Card(
                          child: Text(hotel.name ?? ''),
                        ),
                      );
                    },
                  );
                } else {
                  return Text('Error: ${snapshot.error}');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
Future<HotelData> fetchHotels(String locationId) async {
  var apikey = '76e798ced1msh85028291dc6a219p1775bejsn08175e183865';
  final url = Uri.parse('https://worldwide-hotels.p.rapidapi.com/search');
  final encodedParams = {
    'location_id': locationId,
    'language': 'en_US',
    'currency': 'USD',
  };


  final response = await http.post(
    url,
    headers: {
      'content-type': 'application/x-www-form-urlencoded',
      'X-RapidAPI-Key': apikey,
      'X-RapidAPI-Host': 'worldwide-hotels.p.rapidapi.com',
    },
    body: encodedParams,
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final hotelData = HotelData.fromJson(jsonData);
    return hotelData;
  } else {
    throw Exception('Failed to load hotels');
  }
}