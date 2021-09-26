import 'package:flutter/material.dart';
import 'package:pg_diaco_complaints/feature/data/model/form_model_complait.dart';
import 'package:pg_diaco_complaints/feature/domain/usecase/send_data_form_complait.dart';

enum STATEOFFORMCOMPLAIT {
  success,
  failure,
  inProcess,
  init,
}

class ComplaitFormBloc extends ChangeNotifier {
  ComplaitFormBloc({
    required this.sendDataFormComplait,
  });

  SendDataFormComplait? sendDataFormComplait;
  STATEOFFORMCOMPLAIT stateofformcomplait = STATEOFFORMCOMPLAIT.init;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String _title = '';
  String _desc = '';

  void Function(String)? onChangedTitle(String titleIn) {
    _title = titleIn;
    validationForm();
    notifyListeners();
  }

  void Function(String)? onChangedDesc(String descIn) {
    _desc = descIn;
    validationForm();
    notifyListeners();
  }

  bool validationForm() {
    if (_title.isEmpty || _desc.isEmpty) {
      return false;
    }
    return true;
  }

  Future<void> submitAction() async {
    stateofformcomplait = STATEOFFORMCOMPLAIT.inProcess;
    if (validationForm()) {
      final either = await sendDataFormComplait?.call(
        DataFormParams(
          complait: FormModelComplait(
            data: Data(
              title: _title,
              description: _desc,
              authorization: true,
            ),
          ),
        ),
      );

      either?.fold(
        (failure) {
          resetValues(STATEOFFORMCOMPLAIT.failure);
        },
        (success) {
          resetValues(STATEOFFORMCOMPLAIT.success);
        },
      );
      notifyListeners();
    }
  }

  void resetValues(STATEOFFORMCOMPLAIT changevaluestate) {
    _title = '';
    _desc = '';
    titleController.text = '';
    descriptionController.text = '';
    stateofformcomplait = changevaluestate;
  }

  void resetState() {
    stateofformcomplait = STATEOFFORMCOMPLAIT.init;
    notifyListeners();
  }
}
