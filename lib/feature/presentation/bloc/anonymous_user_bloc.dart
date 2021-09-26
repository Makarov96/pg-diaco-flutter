import 'package:flutter/material.dart';
import 'package:pg_diaco_complaints/core/usecases/use_cases.dart';
import 'package:pg_diaco_complaints/feature/domain/usecase/create_anonymous_user.dart';

enum STATUSOFCREATEANONYMOUSUSER {
  failure,
  success,
  loading,
}

class AnonymousUserBloc extends ChangeNotifier {
  AnonymousUserBloc(this.createAnonymousUser);

  final CreateAnonymousUser? createAnonymousUser;
  STATUSOFCREATEANONYMOUSUSER _statusofcreateanonymoususer =
      STATUSOFCREATEANONYMOUSUSER.loading;
  STATUSOFCREATEANONYMOUSUSER get statusofcreateanonymoususer =>
      _statusofcreateanonymoususer;

  set statusofcreateanonymoususer(STATUSOFCREATEANONYMOUSUSER value) {
    _statusofcreateanonymoususer = value;
    notifyListeners();
  }

  Future<void> createAnonymousUserBloc() async {
    final either = await createAnonymousUser?.call(NoParams());

    either?.fold(
      (failure) {
        _statusofcreateanonymoususer = STATUSOFCREATEANONYMOUSUSER.failure;
        notifyListeners();
      },
      (success) {
        if (success) {
          _statusofcreateanonymoususer = STATUSOFCREATEANONYMOUSUSER.success;
          notifyListeners();
        } else {
          _statusofcreateanonymoususer = STATUSOFCREATEANONYMOUSUSER.failure;
          notifyListeners();
        }
      },
    );
  }

  void resetState() {
    _statusofcreateanonymoususer = STATUSOFCREATEANONYMOUSUSER.loading;
    notifyListeners();
  }
}
