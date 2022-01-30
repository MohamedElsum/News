import 'package:breaking_news/model/everything.dart';
import 'package:breaking_news/services/list_builder.dart';
import 'package:flutter/material.dart';
import 'package:breaking_news/services/news_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apikey = 'b745e0e9156a47808a5f580038798efe';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String selectedCategory = 'business';
  String selectedCountry = 'us';

  DropdownButton<String> dropDown(
      List<String> values, String? name, ValueChanged<String?> fun) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String item in values) {
      var newItem = DropdownMenuItem(
        child: Text(item),
        value: item,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
      items: dropDownItems,
      value: name,
      onChanged: fun,
      elevation: 15,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 30,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 15,
        fontFamily: 'Outfit',
      ),
    );
  }

  List<Articles> newspaper2 = [];
  //late Future<Everything> evertThing;

  Future<Everything> fetchEverything() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$selectedCountry&category=$selectedCategory&apiKey=$apikey'));

    if (response.statusCode == 200) {
      print("success");
      setState(() {
        newspaper2 = Everything.fromJson(jsonDecode(response.body)).articles!;
      });
      return Everything.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      throw Exception('Failed to load album');
    }
  }

  void fetchData() async {
    http.Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$selectedCountry&category=$selectedCategory&apiKey=$apikey'));
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['articles'];
      setState(() {
        newspaper2 = items;
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
     //fetchEverything();
   // fetchData();
    fetchEverything();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text('Breaking News'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      'Category:',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Outfit',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  dropDown(categoryItems, selectedCategory, (value) {
                    setState(() {
                      selectedCategory = value.toString();
                    });
                  }),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Expanded(
                    child: Text(
                      'Country :',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Outfit',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  dropDown(countryItems, selectedCountry, (value) {
                    setState(() {
                      selectedCountry = value.toString();
                    });
                  }),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          // fetchEverything().then((value) => newspaper2 = value.articles!);
                          //fetchData();
                          fetchEverything();
                        });
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(10.0),
              child: NewsModel(newspaper: newspaper2),
            ),
          ),
        ],
      ),
    );
  }
}
