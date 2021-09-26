import 'package:dartz/dartz.dart';
import 'package:pg_diaco_complaints/core/error/exception.dart';
import 'package:pg_diaco_complaints/feature/data/model/form_model.dart';
import 'package:pg_diaco_complaints/feature/data/model/form_model_complait.dart';

abstract class FormRepository {
  Future<Either<ServerException, bool>> sendDataToBackEnd(FormModel formModel);
  Future<Either<ServerException, bool>> createAnonymousUser();
  Future<Either<ServerException, bool>> sendComplait(
      FormModelComplait formModelComplait);
}
