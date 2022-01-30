import 'dart:convert';
import 'package:breaking_news/model/everything.dart';
import 'package:flutter/material.dart';
import 'package:breaking_news/services/news_template.dart';
import 'package:breaking_news/screens/news_details_screen.dart';
import 'package:breaking_news/services/news_data.dart';
import 'package:breaking_news/model/news.dart';
import 'package:http/http.dart' as http;

const apikey = 'b745e0e9156a47808a5f580038798efe';

class NewsModel extends StatefulWidget {

  List<Articles> newspaper;

  NewsModel({Key? key,required this.newspaper}) : super(key: key);

  @override
  _NewsModelState createState() => _NewsModelState();
}

class _NewsModelState extends State<NewsModel> {

  List<NewsTemplate> news = [
    /*
    NewsTemplate(
        name: 'CNN',
        title:
            'Mexican authorities find 600 migrants hidden in two trailers in Veracruz',
        imageName: 'fgg.jpg'),
    NewsTemplate(
        name: 'CNN',
        title:
            'A Texas pastor apologized after a video taken in his church shows people chanting',
        imageName: 'test.jpg'),
    NewsTemplate(
        name: 'CNN',
        title:
            'Jerusalem attack: one dead, four injured, in suspected shooting',
        imageName: 'test2.jpg'),

     */
  ];
/*
  List newspaper = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    http.Response response =await  http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=${widget.country}&category=${widget.category}&apiKey=$apikey'));
    if(response.statusCode == 200){
      var items = json.decode(response.body)['articles'];
      setState(() {
        newspaper = items;
      });
    }else{
      print(response.statusCode);
    }
  }

 */

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.newspaper.length,
      itemBuilder: (context, index) {
        String? photo =  widget.newspaper[index].urlToImage;
        if(photo == null){
         photo = 'https://www.prestashop.com/sites/default/files/styles/blog_750x320/public/blog/2019/10/banner_error_404.jpg?itok=eAS4swln';
        }else{
          photo;
        }
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetails(object:  widget.newspaper[index])));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 10.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: NetworkImage(photo),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${ widget.newspaper[index].title}',
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OutfitMed',
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '${widget.newspaper[index].publishedAt}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Outfit',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
