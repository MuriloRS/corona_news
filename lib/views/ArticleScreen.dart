import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends StatefulWidget {
  Map<String, dynamic> _article;

  ArticleScreen(this._article);
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final f = new DateFormat('dd/MM/yyyy hh:mm');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                "Corona News",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    widget._article['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageFade(
                      image:
                          NetworkImage(widget._article['urlToImage'], scale: 1),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 170,
                      alignment: Alignment.center,
                      placeholder: Container(
                        height: 170,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget._article['source']['name'],
                          style: _getInfoTextStyle()),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(f.format(widget._article['publishedAt']),
                                style: _getInfoTextStyle()),
                            IconButton(
                              onPressed: () {
                                shareArticle(widget._article);
                              },
                              icon: Icon(
                                Icons.share,
                                size: 28,
                                color: Colors.blue[700],
                              ),
                            )
                          ])
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget._article['content'].toString(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: Colors.grey[500],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("PARA LER A NOTÍCIA COMPLETA"),
                  SizedBox(height: 5),
                  Container(
                    child: FlatButton(
                      color: Colors.blue[700],
                      onPressed: () => _launchURL(widget._article['url']),
                      child: Text("Veja no Site",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline)),
                    ),
                  )
                ],
              ),
            )));
  }

  TextStyle _getInfoTextStyle() {
    return TextStyle(fontSize: 15, color: Colors.grey[800]);
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void shareArticle(article) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.whatshot), onPressed: null),
                IconButton(icon: Icon(Icons.whatshot), onPressed: null),
                IconButton(icon: Icon(Icons.whatshot), onPressed: null),
                IconButton(icon: Icon(Icons.whatshot), onPressed: null)
              ],
            ),
            padding: EdgeInsets.all(25.0),
          );
        });
  }
}
