
class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;
  DateTime ? publishedAt ;


  ArticleModel({this.author , this.title , this.description , this.content , this.url  , this.urlToImage ,  this.publishedAt});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'],
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'],
      content: json['content'],
      publishedAt: DateTime.parse(json['publishedAt']),
    );
  }



  
}


