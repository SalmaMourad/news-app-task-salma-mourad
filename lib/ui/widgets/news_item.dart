import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c13/data/models/newsResponse/Articles.dart';

class NewsItem extends StatelessWidget {
  final NewsArticle article;
  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color:Theme.of(context).primaryColor,
            width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: 220,
            child:
          CachedNetworkImage(
            imageUrl: article.urlToImage ??"",
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),),
          Text("${article.title}",
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyMedium
          // TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.bold,
          // ),
          ),
          Row(
            children: [
              Expanded(child: Text("${article.author}",
              maxLines: 1,
              style: Theme.of(context).textTheme.labelSmall
              )),
              Expanded(child: Text("${article.publishedAt}",
              textAlign: TextAlign.end,style: Theme.of(context).textTheme.labelSmall,
              )),
            ],
          )
        ]
      ),
    );
  }
}
