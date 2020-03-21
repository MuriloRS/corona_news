import 'package:corona_news/controllers/HomeController.dart';
import 'package:corona_news/utils/Ordenator.dart';
import 'package:corona_news/views/ArticleScreen.dart';
import 'package:corona_news/widgets/loader.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:intl/intl.dart';

class RecentNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Center(
            child: FutureBuilder(
          future: HomeController.getNews(),
          builder: (context, AsyncSnapshot<Response> snapshot) {
            if (snapshot.connectionState.index == ConnectionState.none.index ||
                snapshot.connectionState.index ==
                    ConnectionState.waiting.index) {
              return Loader();
            } else {
              if (snapshot.data.data['status'] == "ok") {
                List result =
                    Ordenator.orderNewsByDate(snapshot.data.data['articles']);
                final f = new DateFormat('dd/MM/yyyy hh:mm');

                Image image;

                return Container(
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          Map<String, dynamic> article =
                              result.elementAt(index);

                          try {
                            image = Image.network(article['urlToImage']);
                          } catch (e) {}

                          if (image == null) {
                            return Container();
                          }

                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ArticleScreen(article)));
                              },
                              child: Column(
                                children: <Widget>[
                                  Text(article['title'],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ImageFade(
                                    image: NetworkImage(article['urlToImage'],
                                        scale: 1),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 170,
                                    alignment: Alignment.center,
                                    placeholder: Container(
                                      height: 170,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(article['source']['name'],
                                          style: _getInfoTextStyle()),
                                      Text(f.format(article['publishedAt']),
                                          style: _getInfoTextStyle())
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(article['description']),
                                ],
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.grey[800],
                                height: 1,
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        },
                        itemCount: result.length));
              } else {
                return Text("Nenhuma notícias encontrada");
              }
            }
          },
        )));
  }

  TextStyle _getInfoTextStyle() {
    return TextStyle(fontSize: 14, color: Colors.grey[800]);
  }
}
