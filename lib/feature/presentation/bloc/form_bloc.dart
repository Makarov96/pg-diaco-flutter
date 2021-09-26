import 'package:flutter/material.dart';
import 'package:pg_diaco_complaints/core/conf/config_reader.dart';
import 'package:pg_diaco_complaints/core/const/hard_code_data.dart';
import 'package:pg_diaco_complaints/core/model/departament_model.dart';
import 'package:pg_diaco_complaints/feature/data/model/form_model.dart';
import 'package:pg_diaco_complaints/feature/domain/usecase/send_data_form.dart';

enum STATUSOFPOSTMETHOD { failure, success, loading, inProgress }

enum STATEOFDEPTOINFO { init, error, loaded }

class FormBloc extends ChangeNotifier {
  FormBloc({
    required this.sendDataForm,
  });

  STATUSOFPOSTMETHOD _statusofpostmethod = STATUSOFPOSTMETHOD.loading;
  STATUSOFPOSTMETHOD get statusofpostmethod => _statusofpostmethod;

  STATEOFDEPTOINFO stateOfDeptoInfo = STATEOFDEPTOINFO.init;

  late Departament departament;
  late Municipalities municipalities;
  late List<String> departamentInfo;
  late Map<String, List<String>> municipalitiesInfo;
  late String valueDropDown = departamentInfo[0];
  late String valueDropDownMunicipality;
  late List<String> myArray;
  bool isSelected = false;
  bool isSelectedMunicipality = false;
  int currentIndex = 0;

  set statusofpostmethod(STATUSOFPOSTMETHOD value) {
    _statusofpostmethod = value;
    notifyListeners();
  }

  TextEditingController nitController = TextEditingController();
  TextEditingController dpiController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController fisrtLastNameController = TextEditingController();
  TextEditingController secondLastNameController = TextEditingController();
  TextEditingController marriedNameController = TextEditingController();
  TextEditingController docimicilioController = TextEditingController();
  TextEditingController zoneController = TextEditingController();
  TextEditingController directionController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nearByHeadQuartersPhoneController =
      TextEditingController();
  FocusNode focusNodeNit = FocusNode();
  FocusNode focusNodeDPI = FocusNode();
  FocusNode focusNodeFirstName = FocusNode();
  FocusNode focusNodeSecondName = FocusNode();
  FocusNode focusNodeFirstLastName = FocusNode();
  FocusNode focusNodeFirstSeconName = FocusNode();
  FocusNode focusNodeMarriedName = FocusNode();
  FocusNode focusNodeDocimicilioPhone = FocusNode();
  FocusNode focusNodeZone = FocusNode();
  FocusNode focusNodeDirection = FocusNode();
  FocusNode focusNodeMobile = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodeNearby = FocusNode();

  final SendDataForm? sendDataForm;
  String _nationality = '';
  bool hnationalityOne = false;
  bool hnationalityTwo = false;

  String _consumerType = '';
  bool hconsumerOne = false;
  bool hconsumerTwo = false;

  String _gender = '';
  bool hgenderOne = false;
  bool hgenderTwo = false;

  String _nit = '';
  String _dpi = '';
  String _firstName = '';
  String _secondName = '';
  String _fisrtLastName = '';
  String _secondLastName = '';
  String _marriedName = '';
  String _docimicilioPhone = '';
  String _nearByHeadQuarters = '';
  String _zone = '';
  String _direction = '';
  String _mobile = '';
  String _email = '';

  bool validationForm() {
    final regex = RegExp(
        r"""(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])""");

    if (_nationality.isEmpty ||
        _consumerType.isEmpty ||
        _gender.isEmpty ||
        _nit.isEmpty ||
        _dpi.isEmpty ||
        _firstName.isEmpty ||
        _fisrtLastName.isEmpty ||
        _secondLastName.isEmpty ||
        isSelected == false ||
        isSelectedMunicipality == false ||
        _nearByHeadQuarters.isEmpty ||
        _zone.isEmpty ||
        _docimicilioPhone.isEmpty ||
        _mobile.isEmpty ||
        _email.isEmpty ||
        regex.hasMatch(_email) == false ||
        _dpi.length < 13 ||
        _dpi.length > 13 ||
        (_nit.length < 6 || _nit.length > 9)) {
      return false;
    }
    return true;
  }

  String? validatorDPI(dynamic value) {
    final validator = value as String;

    if (validator.isEmpty) {
      return 'Campo requerido';
    } else if (validator.length < 13) {
      return '13 digitos';
    } else if (validator.length > 13) {
      return '13 digitos';
    }
    return null;
  }

  String? validatorNit(dynamic value) {
    final validator = value as String;

    if (validator.isEmpty) {
      return 'Campo requerido';
    } else if (validator.length < 6 || validator.length > 9) {
      return 'No menos a 6 y no mayor a 9';
    }
    return null;
  }

  String? validatorMobile(dynamic value) {
    final validator = value as String;

    if (validator.isEmpty) {
      return 'Campo requerido';
    } else if (validator.length > 8) {
      return 'No mas de 8 numeros';
    }
    return null;
  }

  String? validatorEmail(dynamic value) {
    final validator = value as String;

    if (validator.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  String? validatorDomicialPhone(dynamic value) {
    final validator = value as String;

    if (validator.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  String? validatorByHeadQuarters(dynamic value) {
    final validator = value as String;

    if (validator.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  String? validatorZone(dynamic value) {
    final validator = value as String;

    if (validator.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  String? validatorDirection(dynamic value) {
    final validator = value as String;

    if (validator.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  String? validatorSeconLastName(dynamic value) {
    final validator = value as String;

    if (validator.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  String? validatorSeconFirstName(dynamic value) {
    final validator = value as String;

    if (validator.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  String? validatorLastName(dynamic value) {
    final validator = value as String;

    if (validator.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  String? validatorFirstName(dynamic value) {
    final validator = value as String;

    if (validator.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  void Function(int?)? handleIndex(int index, bool? value) {
    _nationality = nationalityValues[index];
    final result = value!;
    if (index == 0) {
      hnationalityOne = result;
      hnationalityTwo = false;
    } else if (index == 1) {
      hnationalityTwo = result;
      hnationalityOne = false;
    }
    notifyListeners();
  }

  void Function(int?)? handleIndexConsumer(int index, bool? value) {
    _consumerType = consumerTypeValues[index];
    final result = value!;
    if (index == 0) {
      hconsumerOne = result;
      hconsumerTwo = false;
    } else if (index == 1) {
      hconsumerTwo = result;
      hconsumerOne = false;
    }
    notifyListeners();
  }

  void Function(int?)? handleIndexGender(int index, bool? value) {
    _gender = genderTypeValues[index];
    final result = value!;
    if (index == 0) {
      hgenderOne = result;
      hgenderTwo = false;
    } else if (index == 1) {
      hgenderTwo = result;
      hgenderOne = false;
    }
    notifyListeners();
  }

  void Function(String)? onChangedNit(String value) {
    _nit = value;
    notifyListeners();
  }

  void Function(String)? onChangedDpi(String value) {
    _dpi = value;
    notifyListeners();
  }

  void Function(String)? onChangedFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  void Function(String)? onChangedSecondName(String value) {
    _secondName = value;
    notifyListeners();
  }

  void Function(String)? onChangedFirstLastName(String value) {
    _fisrtLastName = value;
    notifyListeners();
  }

  void Function(String)? onChangedSecondLastName(String value) {
    _secondLastName = value;
    notifyListeners();
  }

  void Function(String)? onChangedMerriedName(String value) {
    _marriedName = value;
    notifyListeners();
  }

  void Function(String)? onChangedDirection(String value) {
    _direction = value;
    notifyListeners();
  }

  void Function(String)? onChangedZone(String value) {
    _zone = value;
    notifyListeners();
  }

  void Function(String)? onChangedDocimicilioPhone(String value) {
    _docimicilioPhone = value;
    notifyListeners();
  }

  void Function(String)? onChangedNearByHeadQuarters(String value) {
    _nearByHeadQuarters = value;
    notifyListeners();
  }

  void Function(String?)? onChangeMunicipaity(dynamic value) {
    valueDropDownMunicipality = value as String;

    notifyListeners();
  }

  void Function(String?)? onChangeMobile(dynamic value) {
    _mobile = value as String;

    notifyListeners();
  }

  void Function(String?)? onChangeEmail(dynamic value) {
    _email = value as String;
    notifyListeners();
  }

  void Function(String?)? onChanged(dynamic value) {
    valueDropDown = value as String;
    currentIndex = departamentInfo.indexOf(valueDropDown);
    myArray = municipalitiesInfo[currentIndex.toString()]!;
    valueDropDownMunicipality = myArray[0];
    isSelected = true;
    isSelectedMunicipality = true;
    notifyListeners();
  }

  Future<void> callDataDpto() async {
    try {
      departament = await ConfigReader.getDepartamentData();
      municipalities = await ConfigReader.getMunicipalityData();
      departamentInfo = departament.data;
      municipalitiesInfo = municipalities.data;
      municipalitiesInfo.forEach(
        (key, value) {
          if (key == '0') {
            myArray = value;
          }
        },
      );
      valueDropDownMunicipality = myArray[0];
      stateOfDeptoInfo = STATEOFDEPTOINFO.loaded;
    } catch (e) {
      stateOfDeptoInfo = STATEOFDEPTOINFO.error;
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  Future<void> sendDataToBackEnd() async {
    _statusofpostmethod = STATUSOFPOSTMETHOD.inProgress;
    if (validationForm()) {
      final either = await sendDataForm?.call(
        ParamsSendDataForm(
          formModel: FormModel(
            nationality: _nationality,
            consumerType: _consumerType,
            gender: _gender,
            identificationDocument: _dpi,
            nit: _nit,
            firstName: _firstName,
            secondName: _secondName,
            fisrtLastName: _fisrtLastName,
            secondLastName: _secondLastName,
            marriedName: _marriedName,
            docimicilioPhone: _docimicilioPhone,
            departament: valueDropDown,
            municipality: valueDropDownMunicipality,
            zone: _zone,
            direction: _direction,
            nearbyHeadquarters: _nearByHeadQuarters,
            phoneAddress: _docimicilioPhone,
            mobile: _mobile,
            email: _email,
            authorization: true,
          ),
        ),
      );

      either?.fold(
        (failure) {
          _statusofpostmethod = STATUSOFPOSTMETHOD.failure;
        },
        (success) {
          _statusofpostmethod = STATUSOFPOSTMETHOD.success;
        },
      );
      notifyListeners();
    }
  }

  void resetValues() {
    nitController.text = '';
    dpiController.text = '';
    firstNameController.text = '';
    secondNameController.text = '';
    fisrtLastNameController.text = '';
    secondLastNameController.text = '';
    marriedNameController.text = '';
    docimicilioController.text = '';
    mobileController.text = '';
    nearByHeadQuartersPhoneController.text = '';
    emailController.text = '';
    zoneController.text = '';
    directionController.text = '';
    _direction = '';
    _email = '';
    _mobile = '';
    _zone = '';
    _nationality = '';
    _consumerType = '';
    _gender = '';
    _nit = '';
    _dpi = '';
    _firstName = '';
    _secondName = '';
    _fisrtLastName = '';
    _secondLastName = '';
    _marriedName = '';
    _docimicilioPhone = '';
    isSelected = false;
    isSelectedMunicipality = false;
    currentIndex = 0;
    valueDropDown = departamentInfo[0];
    valueDropDownMunicipality = myArray[0];
    hgenderOne = false;
    hgenderTwo = false;
    hconsumerOne = false;
    hconsumerTwo = false;
    hnationalityOne = false;
    hnationalityTwo = false;
    notifyListeners();
  }

  void resetState() {
    _statusofpostmethod = STATUSOFPOSTMETHOD.loading;
    stateOfDeptoInfo = STATEOFDEPTOINFO.init;
    notifyListeners();
  }
}
