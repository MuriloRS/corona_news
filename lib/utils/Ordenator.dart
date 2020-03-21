
class Ordenator {
  static orderNewsByDate(List news) {
    List newsOrdered = new List();

    news.forEach((n) {
      var parsedDate = DateTime.parse(n['publishedAt'].toString());

      Map<String, dynamic> article = n;

      article['publishedAt'] = parsedDate;

      newsOrdered.add(article);
    });

    newsOrdered.sort((a, b) {
      return b['publishedAt'].compareTo(a['publishedAt']);
    });

    return newsOrdered;
  }
}
