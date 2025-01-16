// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ItemsState extends ItemsState {
  @override
  final String error;
  @override
  final String message;
  @override
  final String searchWord;

  factory _$ItemsState([void Function(ItemsStateBuilder)? updates]) =>
      (new ItemsStateBuilder()..update(updates))._build();

  _$ItemsState._(
      {required this.error, required this.message, required this.searchWord})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(error, r'ItemsState', 'error');
    BuiltValueNullFieldError.checkNotNull(message, r'ItemsState', 'message');
    BuiltValueNullFieldError.checkNotNull(
        searchWord, r'ItemsState', 'searchWord');
  }

  @override
  ItemsState rebuild(void Function(ItemsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemsStateBuilder toBuilder() => new ItemsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemsState &&
        error == other.error &&
        message == other.message &&
        searchWord == other.searchWord;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, searchWord.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ItemsState')
          ..add('error', error)
          ..add('message', message)
          ..add('searchWord', searchWord))
        .toString();
  }
}

class ItemsStateBuilder implements Builder<ItemsState, ItemsStateBuilder> {
  _$ItemsState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _searchWord;
  String? get searchWord => _$this._searchWord;
  set searchWord(String? searchWord) => _$this._searchWord = searchWord;

  ItemsStateBuilder();

  ItemsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _message = $v.message;
      _searchWord = $v.searchWord;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ItemsState;
  }

  @override
  void update(void Function(ItemsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ItemsState build() => _build();

  _$ItemsState _build() {
    final _$result = _$v ??
        new _$ItemsState._(
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'ItemsState', 'error'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ItemsState', 'message'),
            searchWord: BuiltValueNullFieldError.checkNotNull(
                searchWord, r'ItemsState', 'searchWord'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
