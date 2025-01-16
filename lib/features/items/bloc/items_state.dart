



import 'package:built_value/built_value.dart';




part 'items_state.g.dart';


abstract class ItemsState implements Built<ItemsState,
    ItemsStateBuilder> {



  String get error;
  String get message;
  String get searchWord;





  ItemsState._();

  factory ItemsState([void Function(ItemsStateBuilder) updates]) = _$ItemsState;

  factory ItemsState.initial() {
    return ItemsState((b) => b

        ..error=''
        ..message=''
        ..searchWord=''

    );
  }
}


