import 'package:json_annotation/json_annotation.dart';

part 'departament_model.g.dart';

@JsonSerializable()
class DepartamentModel {
  DepartamentModel({
    required this.departament,
    required this.municipalities,
  });

  factory DepartamentModel.fromJson(Map<String, dynamic> json) =>
      _$DepartamentModelFromJson(json);
  Map<String, dynamic> toJson() => _$DepartamentModelToJson(this);
  final Departament departament;
  final Municipalities municipalities;
}

@JsonSerializable()
class Departament {
  Departament({
    required this.data,
  });

  factory Departament.fromJson(Map<String, dynamic> json) =>
      _$DepartamentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartamentToJson(this);
  final List<String> data;
}

@JsonSerializable()
class Municipalities {
  Municipalities({
    required this.data,
  });

  factory Municipalities.fromJson(Map<String, dynamic> json) =>
      _$MunicipalitiesFromJson(json);
  Map<String, dynamic> toJson() => _$MunicipalitiesToJson(this);
  final Map<String, List<String>> data;
}
