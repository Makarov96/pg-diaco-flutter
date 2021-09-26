import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pg_diaco_complaints/core/model/departament_model.dart';

abstract class ConfigReader {
  static late Map<String, dynamic> _config;

  static Future<void> initialize() async {
    final configString = await rootBundle.loadString('config/departament.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static Future<Departament> getDepartamentData() async {
    return DepartamentModel.fromJson(_config).departament;
  }

  static Future<Municipalities> getMunicipalityData() async {
    return DepartamentModel.fromJson(_config).municipalities;
  }
}
