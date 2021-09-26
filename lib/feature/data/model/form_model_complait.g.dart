// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_model_complait.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormModelComplait _$FormModelComplaitFromJson(Map<String, dynamic> json) {
  return FormModelComplait(
    data: Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FormModelComplaitToJson(FormModelComplait instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    title: json['title'] as String,
    description: json['description'] as String,
    authorization: json['authorization'] as bool,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'authorization': instance.authorization,
    };
