import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pg_diaco_complaints/feature/data/remote/remote_data_source_form.dart';
import 'package:pg_diaco_complaints/feature/data/repositories/form_repository_impl.dart';
import 'package:pg_diaco_complaints/feature/domain/repositories/form_repository.dart';
import 'package:pg_diaco_complaints/feature/domain/usecase/create_anonymous_user.dart';
import 'package:pg_diaco_complaints/feature/domain/usecase/send_data_form.dart';
import 'package:pg_diaco_complaints/feature/domain/usecase/send_data_form_complait.dart';
import 'package:pg_diaco_complaints/feature/presentation/bloc/anonymous_user_bloc.dart';
import 'package:pg_diaco_complaints/feature/presentation/bloc/complait_form_bloc.dart';
import 'package:pg_diaco_complaints/feature/presentation/bloc/form_bloc.dart';

//bloc

final provComplaitForm = ChangeNotifierProvider<ComplaitFormBloc>(
  (_ref) => ComplaitFormBloc(
    sendDataFormComplait: _ref.read(diUseCaseSendDataFormComplait),
  ),
);

final provSendDataForm = ChangeNotifierProvider<FormBloc>(
  (ref) => FormBloc(
    sendDataForm: ref.read(diUseCaseFormData),
  ),
);
final provCreateAnonymousUser = ChangeNotifierProvider(
  (ref) => AnonymousUserBloc(
    ref.read(diUseCaseCreateAnonymousUser),
  ),
);

//use cases

final diUseCaseSendDataFormComplait = Provider<SendDataFormComplait>(
  (_ref) => SendDataFormComplait(
    repository: _ref.read(diRepository),
  ),
);

final diUseCaseCreateAnonymousUser = Provider<CreateAnonymousUser>(
  (_ref) => CreateAnonymousUser(
    repository: _ref.read(diRepository),
  ),
);

final diUseCaseFormData = Provider<SendDataForm>(
  (_ref) => SendDataForm(
    repository: _ref.read(diRepository),
  ),
);

//repositories
final diRepository = Provider<FormRepository>(
  (_ref) => FormRepositoryImpl(
    remoteDataSoucerForm: _ref.read(diDataSourceForm),
  ),
);

//data sources
final diDataSourceForm = Provider<RemoteDataSoucerForm>(
  (_ref) => RemoteDataSoucerFormImpl(
    _ref.read(dio),
  ),
);

//core

//external
final dio = Provider<Dio>((_) => Dio());
