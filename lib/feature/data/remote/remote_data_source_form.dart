import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pg_diaco_complaints/core/const/end_point.dart';
import 'package:pg_diaco_complaints/core/error/exception.dart';
import 'package:pg_diaco_complaints/core/helper/error_handler.dart';
import 'package:pg_diaco_complaints/core/helper/save_data_local_storage.dart';
import 'package:pg_diaco_complaints/feature/data/model/form_model.dart';
import 'package:pg_diaco_complaints/feature/data/model/form_model_complait.dart';
import 'package:pg_diaco_complaints/feature/data/model/response_model.dart';

abstract class RemoteDataSoucerForm {
  Future<bool> sendDataToBackEnd(FormModel formModel);
  Future<bool> createAnonymousUser();
  Future<bool> sendComplait(FormModelComplait formModelComplait);
}

const String valueKey =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiZXIiLCJpYXQiO';

class RemoteDataSoucerFormImpl
    with ErrorHandler
    implements RemoteDataSoucerForm {
  RemoteDataSoucerFormImpl(this.dio);
  final Dio dio;
  // SaveDataLocalStorage stoare = SaveDataLocalStorage();

  @override
  Future<bool> createAnonymousUser() async {
    try {
      final response = await dio.post<dynamic>(
        registerAnonymousUser,
      );
      final dynamic _responseString = returnResponse(response);
      final _result = _responseString as Response;
      if (_result.statusCode == 200 || _result.statusCode == 201) {
        final model = ResponseModel.fromJson(json.encode(_result.data));

        await SaveDataLocalStorage.saveValue(valueKey, model.payload.id);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw FetchDataException('Unexpected error');
    }
  }

  @override
  Future<bool> sendComplait(FormModelComplait formModelComplait) async {
    try {
      final dynamic result = await SaveDataLocalStorage.getValue(valueKey);

      final userid = result as String;
      final response = await dio.post<dynamic>(
        creteComplait + userid,
        data: formModelComplait.toJson(),
      );
      final dynamic _responseString = returnResponse(response);
      final _result = _responseString as Response;
      if (_result.statusCode == 200 || _result.statusCode == 201) {
        final model = ResponseModel.fromJson(json.encode(_result.data));
        if (model.success) {
          await SaveDataLocalStorage.clear();
          return true;
        } else {
          await SaveDataLocalStorage.clear();
          return false;
        }
      } else {
        await SaveDataLocalStorage.clear();
        return false;
      }
    } catch (e) {
      throw FetchDataException('Unexpected error');
    }
  }

  @override
  Future<bool> sendDataToBackEnd(FormModel formModel) async {
    final jsonModel = {
      'data': {
        'user': {
          'firstName': formModel.firstName,
          'secondName': formModel.secondName,
          'fisrtLastName': formModel.fisrtLastName,
          'secondLastName': formModel.secondLastName,
          'marriedName': formModel.marriedName,
          'email': formModel.email,
          'countryInfo': {
            'nationality': formModel.nationality,
            'direction': formModel.direction,
            'zone': formModel.zone,
            'departament': formModel.departament,
            'municipality': formModel.municipality,
            'nearbyHeadquarters': formModel.nearbyHeadquarters
          },
          'consumerType': {'consumer': formModel.consumerType},
          'gender': {'genderType': formModel.gender},
          'phone': {
            'phoneNumber': formModel.mobile,
            'phoneAddress': formModel.phoneAddress,
            'mobile': formModel.mobile,
            'docimicilioPhone': formModel.docimicilioPhone
          },
          'personalDoc': {
            'identificationDocument': formModel.identificationDocument,
            'nit': formModel.nit
          }
        }
      }
    };
    try {
      final response = await dio.post<dynamic>(
        registerUser,
        data: jsonModel,
      );
      final dynamic _responseString = returnResponse(response);
      final _result = _responseString as Response;
      if (_result.statusCode == 200 || _result.statusCode == 201) {
        final model = ResponseModel.fromJson(json.encode(_result.data));
        await SaveDataLocalStorage.saveValue(valueKey, model.payload.id);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw FetchDataException('Unexpected error');
    }
  }
}
