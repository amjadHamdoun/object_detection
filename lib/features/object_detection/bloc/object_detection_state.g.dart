// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_detection_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ObjectDetectionState extends ObjectDetectionState {
  @override
  final String error;
  @override
  final String message;
  @override
  final double scale;
  @override
  final String guidanceMessage;
  @override
  final String detectedObjectType;
  @override
  final double detectedConfidence;
  @override
  final String captureDate;
  @override
  final bool objectDetectionDone;

  factory _$ObjectDetectionState(
          [void Function(ObjectDetectionStateBuilder)? updates]) =>
      (new ObjectDetectionStateBuilder()..update(updates))._build();

  _$ObjectDetectionState._(
      {required this.error,
      required this.message,
      required this.scale,
      required this.guidanceMessage,
      required this.detectedObjectType,
      required this.detectedConfidence,
      required this.captureDate,
      required this.objectDetectionDone})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        error, r'ObjectDetectionState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        message, r'ObjectDetectionState', 'message');
    BuiltValueNullFieldError.checkNotNull(
        scale, r'ObjectDetectionState', 'scale');
    BuiltValueNullFieldError.checkNotNull(
        guidanceMessage, r'ObjectDetectionState', 'guidanceMessage');
    BuiltValueNullFieldError.checkNotNull(
        detectedObjectType, r'ObjectDetectionState', 'detectedObjectType');
    BuiltValueNullFieldError.checkNotNull(
        detectedConfidence, r'ObjectDetectionState', 'detectedConfidence');
    BuiltValueNullFieldError.checkNotNull(
        captureDate, r'ObjectDetectionState', 'captureDate');
    BuiltValueNullFieldError.checkNotNull(
        objectDetectionDone, r'ObjectDetectionState', 'objectDetectionDone');
  }

  @override
  ObjectDetectionState rebuild(
          void Function(ObjectDetectionStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ObjectDetectionStateBuilder toBuilder() =>
      new ObjectDetectionStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObjectDetectionState &&
        error == other.error &&
        message == other.message &&
        scale == other.scale &&
        guidanceMessage == other.guidanceMessage &&
        detectedObjectType == other.detectedObjectType &&
        detectedConfidence == other.detectedConfidence &&
        captureDate == other.captureDate &&
        objectDetectionDone == other.objectDetectionDone;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, scale.hashCode);
    _$hash = $jc(_$hash, guidanceMessage.hashCode);
    _$hash = $jc(_$hash, detectedObjectType.hashCode);
    _$hash = $jc(_$hash, detectedConfidence.hashCode);
    _$hash = $jc(_$hash, captureDate.hashCode);
    _$hash = $jc(_$hash, objectDetectionDone.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ObjectDetectionState')
          ..add('error', error)
          ..add('message', message)
          ..add('scale', scale)
          ..add('guidanceMessage', guidanceMessage)
          ..add('detectedObjectType', detectedObjectType)
          ..add('detectedConfidence', detectedConfidence)
          ..add('captureDate', captureDate)
          ..add('objectDetectionDone', objectDetectionDone))
        .toString();
  }
}

class ObjectDetectionStateBuilder
    implements Builder<ObjectDetectionState, ObjectDetectionStateBuilder> {
  _$ObjectDetectionState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  double? _scale;
  double? get scale => _$this._scale;
  set scale(double? scale) => _$this._scale = scale;

  String? _guidanceMessage;
  String? get guidanceMessage => _$this._guidanceMessage;
  set guidanceMessage(String? guidanceMessage) =>
      _$this._guidanceMessage = guidanceMessage;

  String? _detectedObjectType;
  String? get detectedObjectType => _$this._detectedObjectType;
  set detectedObjectType(String? detectedObjectType) =>
      _$this._detectedObjectType = detectedObjectType;

  double? _detectedConfidence;
  double? get detectedConfidence => _$this._detectedConfidence;
  set detectedConfidence(double? detectedConfidence) =>
      _$this._detectedConfidence = detectedConfidence;

  String? _captureDate;
  String? get captureDate => _$this._captureDate;
  set captureDate(String? captureDate) => _$this._captureDate = captureDate;

  bool? _objectDetectionDone;
  bool? get objectDetectionDone => _$this._objectDetectionDone;
  set objectDetectionDone(bool? objectDetectionDone) =>
      _$this._objectDetectionDone = objectDetectionDone;

  ObjectDetectionStateBuilder();

  ObjectDetectionStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _message = $v.message;
      _scale = $v.scale;
      _guidanceMessage = $v.guidanceMessage;
      _detectedObjectType = $v.detectedObjectType;
      _detectedConfidence = $v.detectedConfidence;
      _captureDate = $v.captureDate;
      _objectDetectionDone = $v.objectDetectionDone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ObjectDetectionState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ObjectDetectionState;
  }

  @override
  void update(void Function(ObjectDetectionStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ObjectDetectionState build() => _build();

  _$ObjectDetectionState _build() {
    final _$result = _$v ??
        new _$ObjectDetectionState._(
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'ObjectDetectionState', 'error'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ObjectDetectionState', 'message'),
            scale: BuiltValueNullFieldError.checkNotNull(
                scale, r'ObjectDetectionState', 'scale'),
            guidanceMessage: BuiltValueNullFieldError.checkNotNull(
                guidanceMessage, r'ObjectDetectionState', 'guidanceMessage'),
            detectedObjectType: BuiltValueNullFieldError.checkNotNull(
                detectedObjectType, r'ObjectDetectionState', 'detectedObjectType'),
            detectedConfidence: BuiltValueNullFieldError.checkNotNull(
                detectedConfidence, r'ObjectDetectionState', 'detectedConfidence'),
            captureDate: BuiltValueNullFieldError.checkNotNull(
                captureDate, r'ObjectDetectionState', 'captureDate'),
            objectDetectionDone: BuiltValueNullFieldError.checkNotNull(
                objectDetectionDone, r'ObjectDetectionState', 'objectDetectionDone'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
