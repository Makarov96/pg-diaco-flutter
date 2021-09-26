import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class ResponseModel {
  const ResponseModel({
    required this.success,
    required this.payload,
  });
  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      success: map['success'] as bool,
      payload: Payload.fromMap(map['payload'] as Map<String, dynamic>),
    );
  }

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
  final bool success;
  final Payload payload;

  ResponseModel copyWith({
    bool? success,
    Payload? payload,
  }) {
    return ResponseModel(
      success: success ?? this.success,
      payload: payload ?? this.payload,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'payload': payload.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'ResponseModel(success: $success, payload: $payload)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseModel &&
        other.success == success &&
        other.payload == payload;
  }

  @override
  int get hashCode => success.hashCode ^ payload.hashCode;
}

@immutable
class Payload {
  const Payload({
    required this.id,
  });

  factory Payload.fromJson(String source) => Payload.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory Payload.fromMap(Map<String, dynamic> map) {
    return Payload(
      id: map['id'] as String,
    );
  }

  Payload copyWith({
    String? id,
  }) {
    return Payload(
      id: id ?? this.id,
    );
  }

  final String id;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Payload(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Payload && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
