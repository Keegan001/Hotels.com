import 'package:app1/Models/city_model.dart';
import 'package:app1/Models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _query = TextEditingController();
  var query = '';
  var lolol = '';
  List<dynamic> hotels = [];

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar:
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'City Name',
                hintStyle:const TextStyle(color: Colors.white),
                labelStyle:const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.purple,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      query = _query.text;
                      _query.clear();

                      final locData = await fetchCities(query);
                      if (locData != null) {
                        final loc = locData.results?.data ?? [];

                        final l = loc[0];
                        lolol = l.resultObject!.locationId ?? '';
                        final hotelData = await fetchHotels(lolol);

                        if (hotelData != null) {
                          if (hotelData != null) {
                            setState(() {
                              hotels = hotelData.results?.data ??
                                  []; // Update the hotels state variable
                            });
                            // Display location and hotel details here

                            print('Location name: ${l.resultObject!.name}');
                            for (final hotel in hotels) {
                              print('Hotel name: ${hotel.name}');
                            }
                          } else {
                            print(
                                'Error fetching hotels for ${l.resultObject!.name}');
                          }
                        }
                      }
                      ;
                    }),
              ),
              controller: _query,
            ),
            FutureBuilder(
              future: fetchHotels(lolol),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (hotels.isEmpty) {
                    return const Center(
                      child: Text('Enter a city to find hotels'),
                    );
                  }
                  return SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: hotels.length,
                      itemBuilder: (context, index) {
                        final hotel = hotels[index];
                        return SizedBox(
                          height: 150,
                          child: Card(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  alignment: Alignment.centerLeft,
                                  image: NetworkImage(hotel
                                          .photo.images.small.url ??
                                      'https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-5529.jpg?w=740&t=st=1710549756~exp=1710550356~hmac=3bc8f614cff33dac8abc1ef5112ec83bb06f8e70fd99a782edf79ffdcc7d1304'),
                                
                                ),
                              ),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  width: 250,
                                  child: Column(
                                    children: [
                                      Text(
                                        hotel.name ?? '',
                                        style:const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                          'Hotel Ranking: ${hotel.ranking ?? ''}'),
                                      Text(
                                          'Hotel Rating: ${hotel.rating ?? ''}')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        ),
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

Future<LocModel> fetchCities(String query) async {
  var apikey = '76e798ced1msh85028291dc6a219p1775bejsn08175e183865';
  final url = Uri.parse('https://worldwide-hotels.p.rapidapi.com/typeahead');
  final encodedParams = {
    'q': query,
    'language': 'en_US',
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
    final locData = LocModel.fromJson(jsonData);
    return locData;
  } else {
    throw Exception('Failed to load hotels');
  }
}
