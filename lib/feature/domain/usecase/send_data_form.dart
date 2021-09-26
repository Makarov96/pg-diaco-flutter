import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pg_diaco_complaints/core/error/exception.dart';
import 'package:pg_diaco_complaints/core/usecases/use_cases.dart';
import 'package:pg_diaco_complaints/feature/data/model/form_model.dart';
import 'package:pg_diaco_complaints/feature/domain/repositories/form_repository.dart';

class SendDataForm implements UseCase<bool, ParamsSendDataForm> {
  SendDataForm({
    required this.repository,
  });
  final FormRepository repository;

  @override
  Future<Either<ServerException, bool>> call(ParamsSendDataForm params) async =>
      repository.sendDataToBackEnd(params.formModel);
}

@immutable
class ParamsSendDataForm extends Equatable {
  const ParamsSendDataForm({
    required this.formModel,
  });
  final FormModel formModel;

  @override
  List<Object> get props => [formModel];
}
