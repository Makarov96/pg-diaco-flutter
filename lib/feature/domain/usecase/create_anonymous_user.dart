import 'package:dartz/dartz.dart';
import 'package:pg_diaco_complaints/core/error/exception.dart';
import 'package:pg_diaco_complaints/core/usecases/use_cases.dart';
import 'package:pg_diaco_complaints/feature/domain/repositories/form_repository.dart';

class CreateAnonymousUser implements UseCase<bool, NoParams> {
  CreateAnonymousUser({
    required this.repository,
  });
  final FormRepository repository;
  @override
  Future<Either<ServerException, bool>> call(NoParams params) async =>
      repository.createAnonymousUser();
}
