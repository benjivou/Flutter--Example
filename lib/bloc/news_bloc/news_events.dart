import 'package:equatable/equatable.dart';

abstract class NewsEvents extends Equatable {
  @override
  List<Object> get props => [];
}
/// First event to start the bloc
class InitNewsEvents extends NewsEvents{}

/// Refresh the list of news
class RefreshNewsEvents extends NewsEvents{
}

