import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String author;

  const ArticleScreen(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.author});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
    bool isLiked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: widget.imageUrl != null && widget.imageUrl.isNotEmpty
                              ? NetworkImage(widget.imageUrl)
                              : const AssetImage('assets/images/no-image.jpg')
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 300,
                      color: const Color(0XFF6096BA).withOpacity(0.4),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 20,
                  right: 20,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'InknutAnBlack',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    softWrap: true, // Permet le retour à la ligne
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'InknutAn',
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF274C77)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Created by ${widget.author}',
                style: const TextStyle(
                  color: Color(0XFF6096BA),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Share',
        backgroundColor: const Color(0XFF6096BA).withOpacity(0.2),
        foregroundColor: const Color(0XFF274C77),
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(Icons.share),
      ),


















      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final String text = '$title\n\n$description\n\nCreated by $author';

      //     try {
      //       // Share via share_plus package
      //       await Share.share(text, subject: 'Check out this cool item!');

      //       // Wait a bit for the share dialog to disappear
      //       await Future.delayed(Duration(seconds: 1));

      //       // Now launch Facebook
      //       final facebookUrl =
      //           'https://www.facebook.com/sharer/sharer.php?u=$text';
      //       if (await canLaunch(facebookUrl)) {
      //         await launch(facebookUrl);
      //       } else {
      //         throw 'Could not launch Facebook';
      //       }

      //       // Wait again for the launcher to finish
      //       await Future.delayed(Duration(seconds: 1));

      //       // Now launch Twitter
      //       final twitterUrl = 'https://twitter.com/intent/tweet?text=$text';
      //       if (await canLaunch(twitterUrl)) {
      //         await launch(twitterUrl);
      //       } else {
      //         throw 'Could not launch Twitter';
      //       }

      //       // Wait again for the launcher to finish
      //       await Future.delayed(Duration(seconds: 1));

      //       // Example for Instagram (note: direct text sharing is not supported via URL)
      //       // Launch Instagram's profile page
      //       final instagramUrl = 'https://www.instagram.com/';
      //       if (await canLaunch(instagramUrl)) {
      //         await launch(instagramUrl);
      //       } else {
      //         throw 'Could not launch Instagram';
      //       }

      //       // Wait again for the launcher to finish
      //       await Future.delayed(Duration(seconds: 1));

      //       // Now launch WhatsApp
      //       final whatsappUrl = 'https://wa.me/?text=$text';
      //       if (await canLaunch(whatsappUrl)) {
      //         await launch(whatsappUrl);
      //       } else {
      //         throw 'Could not launch WhatsApp';
      //       }
      //     } catch (e) {
      //       print('Error sharing: $e');
      //     }
      //   },
      //   tooltip: 'Share',
      //   backgroundColor: const Color(0XFF6096BA).withOpacity(0.2),
      //   foregroundColor: const Color(0XFF274C77),
      //   elevation: 0,
      //   shape: const CircleBorder(),
      //   child: const Icon(Icons.share),
      // ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final String text = '$title\n\n$description\n\nCreated by $author';

      //     // WhatsApp
      //     final Uri whatsappUri = Uri.parse('whatsapp://send?text=$text');
      //     if (await canLaunch(whatsappUri.toString())) {
      //       await launch(whatsappUri.toString());
      //     } else {
      //       print('Could not launch WhatsApp');
      //     }

      //     // Facebook
      //     final Uri facebookUri =
      //         Uri.parse('https://www.facebook.com/sharer/sharer.php?u=$text');
      //     if (await canLaunch(facebookUri.toString())) {
      //       await launch(facebookUri.toString());
      //     } else {
      //       print('Could not launch Facebook');
      //     }

      //     final Uri instagramUri = Uri.parse('https://www.instagram.com/');
      //     if (await canLaunch(instagramUri.toString())) {
      //       await launch(instagramUri.toString());
      //     } else {
      //       print('Could not launch Instagram');
      //     }
      //   },
      //   tooltip: 'Share',
      //   backgroundColor: const Color(0XFF6096BA).withOpacity(0.2),
      //   foregroundColor: const Color(0XFF274C77),
      //   elevation: 0,
      //   shape: const CircleBorder(),
      //   child: const Icon(Icons.share),
      // ),
    );
  }
}
