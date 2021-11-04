import 'package:app/bloc/news_bloc/news_events.dart';
import 'package:app/bloc/news_bloc/news_state.dart';
import 'package:app/model/news.dart';
import 'package:app/utilities/api_utils.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  List<News>? listOfNews;

  NewsBloc() : super(InitNewsState());

  @override
  Stream<NewsState> mapEventToState(NewsEvents event) async* {
    if (event is InitNewsEvents) {
      yield InitNewsState();
      listOfNews = await ApiUtils().getNews();
      yield RefreshListNewsState(listOfNews!);
    }
    if (event is RefreshNewsEvents) {
      yield LaunchRefreshState();
      listOfNews = await ApiUtils().getNews();
      yield RefreshListNewsState(listOfNews!);
    }
  }
}
