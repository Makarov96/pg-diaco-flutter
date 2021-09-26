import 'package:dartz/dartz.dart';
import 'package:pg_diaco_complaints/core/error/exception.dart';
import 'package:pg_diaco_complaints/feature/data/model/form_model.dart';
import 'package:pg_diaco_complaints/feature/data/model/form_model_complait.dart';
import 'package:pg_diaco_complaints/feature/data/remote/remote_data_source_form.dart';
import 'package:pg_diaco_complaints/feature/domain/repositories/form_repository.dart';

typedef _HandleSendDataForm = Future<bool> Function();
typedef _HandleCreateAnonymousUser = Future<bool> Function();
typedef _HandleSendComplait = Future<bool> Function();

class FormRepositoryImpl implements FormRepository {
  FormRepositoryImpl({required this.remoteDataSoucerForm});
  final RemoteDataSoucerForm remoteDataSoucerForm;

  @override
  Future<Either<ServerException, bool>> sendDataToBackEnd(
          FormModel formModel) async =>
      _handleSendDataToBackEnd(
        () {
          return remoteDataSoucerForm.sendDataToBackEnd(formModel);
        },
      );

  @override
  Future<Either<ServerException, bool>> createAnonymousUser() async =>
      _handlecreateAnonymousUser(remoteDataSoucerForm.createAnonymousUser);

  @override
  Future<Either<ServerException, bool>> sendComplait(
          FormModelComplait formModelComplait) async =>
      _handleSendComplait(() {
        return remoteDataSoucerForm.sendComplait(formModelComplait);
      });

  Future<Either<ServerException, bool>> _handleSendComplait(
      _HandleSendComplait handleSendComplait) async {
    try {
      final response = await handleSendComplait();
      return Right(response);
    } on ServerException {
      return Left(FetchDataException('Failure call to api'));
    }
  }

  Future<Either<ServerException, bool>> _handlecreateAnonymousUser(
      _HandleCreateAnonymousUser handleCreateAnonymousUser) async {
    try {
      final response = await handleCreateAnonymousUser();
      return Right(response);
    } on ServerException {
      return Left(FetchDataException('Failure call to api'));
    }
  }

  Future<Either<ServerException, bool>> _handleSendDataToBackEnd(
      _HandleSendDataForm handleSendDataForm) async {
    try {
      final response = await handleSendDataForm();
      return Right(response);
    } on ServerException {
      return Left(FetchDataException('Failure call to api'));
    }
  }
}
