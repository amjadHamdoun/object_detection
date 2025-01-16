import 'dart:developer';
import 'dart:ui';

import 'package:akw/core/constant/app_constants.dart';
import 'package:akw/core/constant/key_constants.dart';
import 'package:akw/preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import 'items_state.dart';

part 'items_event.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {

  ItemsBloc()
      : super(ItemsState.initial()) {

    on<SearchEvent>((event, emit) async {
      emit(state.rebuild((b) => b..searchWord = event.search));
    });

  }
}
