// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'form_model_complait.g.dart';

@JsonSerializable()
class FormModelComplait {
  FormModelComplait({
    required this.data,
  });
  factory FormModelComplait.fromJson(Map<String, dynamic> json) =>
      _$FormModelComplaitFromJson(json);
  Map<String, dynamic> toJson() => _$FormModelComplaitToJson(this);
  final Data data;
}

@JsonSerializable()
class Data {
  Data({
    required this.title,
    required this.description,
    required this.authorization,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
  final String title;
  final String description;
  final bool authorization;
}
