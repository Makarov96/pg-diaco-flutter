import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pg_diaco_complaints/core/error/exception.dart';
import 'package:pg_diaco_complaints/core/usecases/use_cases.dart';
import 'package:pg_diaco_complaints/feature/data/model/form_model_complait.dart';
import 'package:pg_diaco_complaints/feature/domain/repositories/form_repository.dart';

class SendDataFormComplait implements UseCase<bool, DataFormParams> {
  SendDataFormComplait({
    required this.repository,
  });
  final FormRepository repository;
  @override
  Future<Either<ServerException, bool>> call(DataFormParams params) async =>
      repository.sendComplait(params.complait);
}

@immutable
class DataFormParams extends Equatable {
  const DataFormParams({
    required this.complait,
  });

  final FormModelComplait complait;

  @override
  List<Object?> get props => [
        complait,
      ];
}
