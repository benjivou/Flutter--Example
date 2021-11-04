import 'package:app/bloc/news_bloc/news_bloc.dart';
import 'package:app/bloc/news_bloc/news_events.dart';
import 'package:app/bloc/news_bloc/news_state.dart';
import 'package:app/model/news.dart';
import 'package:app/widget/custom_list_tile.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<News> listNews;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        leading: IconButton(
          onPressed: _refresh,
          icon: const Icon(Icons.refresh),
        ),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (BuildContext context, NewsState state) {
          if (state is InitNewsState) {
            return loardingScreen();
          }
          if(state is LaunchRefreshState){
            return loardingScreen();
          }
          if (state is RefreshListNewsState) {
            listNews = state.listOfNews;

            return _createListOfNews();
          }
          return Container();
        },
      ),
    );
  }

  /// This the screen displayed when we are waiting to retrive datas
  Widget loardingScreen() {
    return Center(
      child: Text(AppLocalizations.of(context)!.currentlyLoadingNews),
    );
  }

  /// Transfort the list of elements in memory to a list of widgets displayable
  Widget _createListOfNews() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: listNews.length,
        itemBuilder: (context, index) {
          News news = listNews[index];
          String title = "";
          title = (news.title != null) ? news.title! : '';


          Widget trailing =
              (news.urlToImage == null || !(news.urlToImage!.contains("http")))
                  ? Container(
                      color: Theme.of(context).primaryColor,
                      width: double.infinity,
                    )
                  : Image.network(news.urlToImage!);

          return CustomListItem(
              thumbnail: trailing, title: title, sourceUrl: news.url!);
        });
  }

  /// refresh the list of news we have
  void _refresh() {
    BlocProvider.of<NewsBloc>(context).add(RefreshNewsEvents());
  }
}
