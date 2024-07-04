import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/screens/article_screen.dart';
import 'package:newsapp/services/news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    "All",
    "Sports",
    "Health",
    "Science",
    "Technology",
    "Business"
  ];

  List<ArticleModel> articles = [];
  bool _loading = true;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews({String category = ''}) async {
    setState(() {
      _loading = true;
    });

    News newsInstance = News();
    await newsInstance.getNews(category: category);
    setState(() {
      articles = newsInstance.news;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/newspaper.png',
                width: 25,
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'The ',
                        style: TextStyle(
                          fontFamily: 'InknutAn',
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF274C77),
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'Daily',
                        style: TextStyle(
                          fontFamily: 'InknutAn',
                          fontWeight: FontWeight.w900,
                          color: Color(0XFF6096BA),
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: ' Scoop',
                        style: TextStyle(
                          fontFamily: 'InknutAn',
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF274C77),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Breaking News",
              style: TextStyle(
                color: Color(0xFF274C77),
                fontSize: 25,
                fontFamily: 'InknutAn',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        if (categories[index] == "All") {
                          getNews();
                        } else {
                          getNews(category: categories[index].toLowerCase());
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 2),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: index == selectedIndex
                                  ? const Color(0XFF274C77)
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: index == selectedIndex
                                ? const Color(0XFF274C77)
                                : const Color(0XFF6096BA),
                            fontFamily: 'InknutAn',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : articles.isEmpty
                    ? const Center(child: Text('No news available'))
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            ArticleModel article = articles[index];

                            String truncatedDescription = article
                                        .description!.length >
                                    50
                                ? "${article.description!.substring(0, 50)}..."
                                : article.description!;

                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ArticleScreen(
                                        imageUrl: article.urlToImage ?? '',
                                        title: article.title ?? '',
                                        description: article.description ?? '',
                                        author: article.author ?? ''),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      const Color(0XFF6096BA).withOpacity(0.2),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: article.urlToImage != null
                                            ? Image.network(
                                                article.urlToImage!,
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.cover,
                                              )
                                            : Container(
                                                color: Colors.grey,
                                                child: const Icon(
                                                  Icons.image,
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            article.title!,
                                            style: const TextStyle(
                                              fontSize: 9,
                                              fontFamily: 'InknutAn',
                                              fontWeight: FontWeight.w300,
                                              color: Color(0XFF6096BA),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            truncatedDescription,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'InknutAn',
                                              fontWeight: FontWeight.w900,
                                              color: Color(0XFF274C77),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                              DateFormat.yMMMd()
                                                  .format(article.publishedAt!),
                                              style: const TextStyle(
                                                fontSize: 7,
                                                color: Color(0XFF6096BA),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
