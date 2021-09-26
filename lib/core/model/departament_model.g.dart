// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departament_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartamentModel _$DepartamentModelFromJson(Map<String, dynamic> json) {
  return DepartamentModel(
    departament:
        Departament.fromJson(json['departament'] as Map<String, dynamic>),
    municipalities:
        Municipalities.fromJson(json['municipalities'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DepartamentModelToJson(DepartamentModel instance) =>
    <String, dynamic>{
      'departament': instance.departament,
      'municipalities': instance.municipalities,
    };

Departament _$DepartamentFromJson(Map<String, dynamic> json) {
  return Departament(
    data: (json['data'] as List<dynamic>)
        .map((dynamic e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$DepartamentToJson(Departament instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Municipalities _$MunicipalitiesFromJson(Map<String, dynamic> json) {
  return Municipalities(
    data: (json['data'] as Map<String, dynamic>).map(
      (k, dynamic e) => MapEntry(
          k, (e as List<dynamic>).map((dynamic e) => e as String).toList()),
    ),
  );
}

Map<String, dynamic> _$MunicipalitiesToJson(Municipalities instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
