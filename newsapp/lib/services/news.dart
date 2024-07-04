import 'package:newsapp/models/article_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews({String category = ''}) async {
    String url = category.isEmpty
        ? 'https://newsapi.org/v2/everything?q=all&apiKey=1f9e5a47f39347a79491e0978f482c7b'
        : 'https://newsapi.org/v2/top-headlines?country=ma&category=$category&apiKey=1f9e5a47f39347a79491e0978f482c7b';

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['status'] == "ok") {
          jsonData["articles"].forEach((element) {
            ArticleModel articleModel = ArticleModel.fromJson(element);
              news.add(articleModel);
            // if (element["urlToImage"] != null &&
            //     element["description"] != null) {
              
            // }
          });
        }
      } else {
        print('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}




// import 'package:newsapp/models/article_model.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class News {
//   List<ArticleModel> news = [];

//   Future<void> getNews() async {
//     String url =
//         'https://newsapi.org/v2/everything?q=all&apiKey=1f9e5a47f39347a79491e0978f482c7b';

//     var response = await http.get(Uri.parse(url));
//     var jsonData = jsonDecode(response.body);

//     if (jsonData['status'] == "ok") {
//       jsonData["articles"].forEach((element) {
//         if (element["urlToImage"] != null && element["description"] != null) {
//           ArticleModel articleModel = ArticleModel(
//             author: element['author'],
//             title: element['title'],
//             description: element['description'],
//             url: element['url'],
//             urlToImage: element['urlToImage'],
//             content: element['content'],
//           );
//           news.add(articleModel);
//         }
//       });
//     }
//   }
// }
