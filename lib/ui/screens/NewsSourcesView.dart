import 'package:flutter/material.dart';
import 'package:news_app_c13/api/ApiManager.dart';
import 'package:news_app_c13/data/models/sourceResponse/Source.dart';
import 'package:news_app_c13/ui/widgets/LoadingWidget.dart';
import 'package:news_app_c13/ui/widgets/news_list_view.dart';

import '../../search/search_screen.dart';

class Newssourcesview extends StatefulWidget {
  List<Source> sources;
  Newssourcesview(this.sources, {super.key});

  @override
  State<Newssourcesview> createState() => _NewssourcesviewState();
}

class _NewssourcesviewState extends State<Newssourcesview> {

  @override
  void initState() {
    super.initState();
  }
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
      //     IconButton(
      //         onPressed: () {Navigator.pushNamed(
      //   context,
      //   SearchScreen.routeName,
      //   // arguments: category,
      // );},
              // icon: const Icon(
              //   Icons.search,
              //   size: 30,
              // )
              // ),
          TabBar(
            labelColor: Theme.of(context).primaryColor,
            isScrollable: true,
            tabs: buildTabs(widget.sources),
            onTap: (index) {
              setState(() {
                selectedIndex = index;

              });
              // Trigger fetching news when tab is tapped
            },
          ),
          Expanded(child:

          FutureBuilder(
            future: ApiManager.getInstance().getNews(widget.sources[selectedIndex].id ??""),
              builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return LoadingWidget();
              }else if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              }

               var newsList = snapshot.data?.articles ?? [];
              return NewsListView(articles: newsList);
              },
          )
          )
        ],
      ),
    );
  }

  List<Tab> buildTabs(List<Source> sources) {
    return sources
        .map((source) => Tab(
              child: Text(
                source.name ?? "",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ))
        .toList();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
