import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c13/core/app_colors.dart';
import 'package:news_app_c13/data/models/newsResponse/Articles.dart';

class NewsItem extends StatelessWidget {
  final NewsArticle article;
  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          context: context,
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.only(left: 8, right: 8,top: 14),
              // height: 250,
              height: MediaQuery.of(context).size.height * 0.55,

              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: article.urlToImage ?? "",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      style: Theme.of(context).textTheme.displayLarge,
                      article.description ?? "",
                      maxLines: 5,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    ElevatedButton(
                      child: const Text('View Full Article'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            width: double.infinity,
            height: 220,
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
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
              Expanded(
                  child: Text("${article.author}",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelSmall)),
              Expanded(
                  child: Text(
                "${article.publishedAt}",
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.labelSmall,
              )),
            ],
          )
        ]),
      ),
    );
  }
}
