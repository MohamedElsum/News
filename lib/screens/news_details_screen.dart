import 'package:breaking_news/services/news_template.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  var object;

  NewsDetails({required this.object});

  @override
  Widget build(BuildContext context) {
    var photoUrl;
    var notFound =
        'https://www.prestashop.com/sites/default/files/styles/blog_750x320/public/blog/2019/10/banner_error_404.jpg?itok=eAS4swln';

    if (object['urlToImage'] == null) {
      photoUrl = notFound;
    } else {
      photoUrl = object['urlToImage'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Breaking News'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: NetworkImage(photoUrl),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    '${object['title']}',
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Outfit'),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 30.0,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${object['description']}',
                    style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Outfit'),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 30.0,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'To Read More...',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: 'Click here',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 15.0,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url = '${object['url']}';
                                await launch(url);
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
