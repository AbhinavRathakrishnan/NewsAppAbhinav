import 'package:flutter/material.dart';
import '../models/news_model.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  NewsCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          article.urlToImage.isNotEmpty
              ? Image.network(article.urlToImage, fit: BoxFit.cover)
              : Container(height: 200, color: Colors.grey),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(article.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(article.description,
                maxLines: 3, overflow: TextOverflow.ellipsis),
          ),
          TextButton(
            onPressed: () {
              // Open article URL
            },
            child: Text('Read More'),
          ),
        ],
      ),
    );
  }
}
