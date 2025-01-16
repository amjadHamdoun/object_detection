part of 'items_bloc.dart';

abstract class ItemsEvent extends Equatable {
  const ItemsEvent();
  @override
  List<Object> get props => [];
}



class SearchEvent extends ItemsEvent {
  final String search;
  const SearchEvent(this.search);
}






