import 'dart:async';

import 'package:flutter/widgets.dart';

import 'base_event.dart';

abstract class BaseBloc {
  StreamController<BaseEvent> _streamController = StreamController<BaseEvent>();
  Sink<BaseEvent> get event => _streamController.sink;

  BaseBloc() {
    _streamController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception('Invalid event!!');
      }
      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvent event); // abstract method

  @mustCallSuper
  void dispose() {
    _streamController.close();
  }
}
