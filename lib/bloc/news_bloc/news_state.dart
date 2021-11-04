import 'package:app/model/news.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Init the search of news
class InitNewsState extends NewsState {}

/// You want to force Refresh the list of news
class LaunchRefreshState extends NewsState {}

/// A new List of news is available
class NewNewsState extends NewsState {
  List<News>? listOfNews;
  NewNewsState(this.listOfNews);
}
