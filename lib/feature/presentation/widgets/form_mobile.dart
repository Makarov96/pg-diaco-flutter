import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:pg_diaco_complaints/core/const/text_style.dart';
import 'package:pg_diaco_complaints/core/const/value_string.dart';

import 'package:pg_diaco_complaints/di_container.dart';
import 'package:pg_diaco_complaints/feature/presentation/bloc/form_bloc.dart';
import 'package:pg_diaco_complaints/feature/presentation/screen/screen_complait.dart';
import 'package:pg_diaco_complaints/feature/presentation/screen/validation_screen.dart';
import 'package:pg_diaco_complaints/widgets/dialog/general_dialog.dart';
import 'package:pg_diaco_complaints/widgets/dialog/general_radio_button.dart';
import 'package:pg_diaco_complaints/widgets/drop_down_input.dart';
import 'package:pg_diaco_complaints/widgets/general_button.dart';

///Form for the capture de information of user
class FormMobileWidget extends StatefulWidget {
  ///Form for the capture de information of user
  const FormMobileWidget({Key? key}) : super(key: key);

  @override
  _FormMobileWidgetState createState() => _FormMobileWidgetState();
}

class _FormMobileWidgetState extends State<FormMobileWidget> {
  @override
  void initState() {
    Future.delayed(Duration.zero, callData);
    super.initState();
  }

  Future<void> callData() async {
    await context.read(provSendDataForm).callDataDpto();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderListener<FormBloc>(
      onChange: (context, state) {
        switch (state.statusofpostmethod) {
          case STATUSOFPOSTMETHOD.inProgress:
            showLoadingDialog(
              context: context,
              title: 'Cargando...',
              content: const Center(
                child: CircularProgressIndicator(),
              ),
            );

            break;
          case STATUSOFPOSTMETHOD.success:
            showAlertDialog(
              context: context,
              valueTextButton: 'Aceptar',
              title: 'Accion realizada con exito',
              content: '',
              onPressed: () {
                state
                  ..resetValues()
                  ..resetState();

                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ComplaitFormScreen(),
                  ),
                );
              },
            );
            break;
          case STATUSOFPOSTMETHOD.failure:
            showAlertDialog(
              context: context,
              valueTextButton: 'Aceptar',
              title: 'Alerta',
              content: 'Al parecer algo a salido mal',
              onPressed: () {
                state
                  ..resetValues()
                  ..resetState();
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ValidationScreen(),
                  ),
                );
              },
            );
            break;

          default:
            return;
        }
      },
      provider: provSendDataForm,
      child: Consumer(
        builder: (_, ref, widget) {
          switch (ref(provSendDataForm).stateOfDeptoInfo) {
            case STATEOFDEPTOINFO.error:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case STATEOFDEPTOINFO.init:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case STATEOFDEPTOINFO.loaded:
              return KeyboardActions(
                config: KeyboardActionsConfig(
                  actions: [
                    KeyboardActionsItem(
                      focusNode: context.read(provSendDataForm).focusNodeNit,
                    ),
                    KeyboardActionsItem(
                      focusNode: context.read(provSendDataForm).focusNodeDPI,
                    ),
                    KeyboardActionsItem(
                      focusNode:
                          context.read(provSendDataForm).focusNodeFirstName,
                    ),
                    KeyboardActionsItem(
                      focusNode:
                          context.read(provSendDataForm).focusNodeSecondName,
                    ),
                    KeyboardActionsItem(
                      focusNode:
                          context.read(provSendDataForm).focusNodeFirstLastName,
                    ),
                    KeyboardActionsItem(
                      focusNode: context
                          .read(provSendDataForm)
                          .focusNodeFirstSeconName,
                    ),
                    KeyboardActionsItem(
                      focusNode:
                          context.read(provSendDataForm).focusNodeMarriedName,
                    ),
                    KeyboardActionsItem(
                      focusNode:
                          context.read(provSendDataForm).focusNodeDirection,
                    ),
                    KeyboardActionsItem(
                      focusNode: context.read(provSendDataForm).focusNodeZone,
                    ),
                    KeyboardActionsItem(
                      focusNode: context.read(provSendDataForm).focusNodeNearby,
                    ),
                    KeyboardActionsItem(
                      focusNode: context
                          .read(provSendDataForm)
                          .focusNodeDocimicilioPhone,
                    ),
                    KeyboardActionsItem(
                      focusNode: context.read(provSendDataForm).focusNodeMobile,
                    ),
                    KeyboardActionsItem(
                      focusNode: context.read(provSendDataForm).focusNodeEmail,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: 400.w,
                    ),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2.sp),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 30.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      nationality,
                                      style: titleTextStyle,
                                    ),
                                    const Text(
                                      consumerType,
                                      style: titleTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        2,
                                        (index) => GeneralRadiosButton(
                                          value: index == 0
                                              ? ref(provSendDataForm)
                                                  .hnationalityOne
                                              : ref(provSendDataForm)
                                                  .hnationalityTwo,
                                          onChanged: (value) =>
                                              ref(provSendDataForm)
                                                  .handleIndex(index, value),
                                          textValue: index == 0
                                              ? guatemalan
                                              : foreigner,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 35.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        2,
                                        (index) => GeneralRadiosButton(
                                          value: index == 0
                                              ? ref(provSendDataForm)
                                                  .hconsumerOne
                                              : ref(provSendDataForm)
                                                  .hconsumerTwo,
                                          onChanged: (value) =>
                                              ref(provSendDataForm)
                                                  .handleIndexConsumer(
                                                      index, value),
                                          textValue: index == 0
                                              ? individualConsumer
                                              : juridicConsumer,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                const Text(
                                  gender,
                                  style: titleTextStyle,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    2,
                                    (index) => GeneralRadiosButton(
                                      onChanged: (value) =>
                                          ref(provSendDataForm)
                                              .handleIndexGender(index, value),
                                      textValue: index == 0 ? male : female,
                                      value: index == 0
                                          ? ref(provSendDataForm).hgenderOne
                                          : ref(provSendDataForm).hgenderTwo,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: ref(provSendDataForm).validatorNit,
                                  focusNode: context
                                      .read(provSendDataForm)
                                      .focusNodeNit,
                                  controller:
                                      ref(provSendDataForm).nitController,
                                  onChanged: ref(provSendDataForm).onChangedNit,
                                  decoration: const InputDecoration(
                                    hintText: 'Nit:',
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: ref(provSendDataForm).validatorDPI,
                                  focusNode: context
                                      .read(provSendDataForm)
                                      .focusNodeDPI,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  onChanged: ref(provSendDataForm).onChangedDpi,
                                  controller:
                                      ref(provSendDataForm).dpiController,
                                  decoration: const InputDecoration(
                                    hintText: 'Documento de indentificacion:',
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator:
                                      ref(provSendDataForm).validatorFirstName,
                                  focusNode:
                                      ref(provSendDataForm).focusNodeFirstName,
                                  controller:
                                      ref(provSendDataForm).firstNameController,
                                  onChanged:
                                      ref(provSendDataForm).onChangedFirstName,
                                  decoration: const InputDecoration(
                                    hintText: 'Primer Nombre',
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator:
                                      ref(provSendDataForm).validatorLastName,
                                  focusNode:
                                      ref(provSendDataForm).focusNodeSecondName,
                                  onChanged:
                                      ref(provSendDataForm).onChangedSecondName,
                                  controller: ref(provSendDataForm)
                                      .secondNameController,
                                  decoration: const InputDecoration(
                                    hintText: 'Segundo Nombre',
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: ref(provSendDataForm)
                                      .validatorSeconFirstName,
                                  focusNode: ref(provSendDataForm)
                                      .focusNodeFirstLastName,
                                  controller: ref(provSendDataForm)
                                      .fisrtLastNameController,
                                  onChanged: ref(provSendDataForm)
                                      .onChangedFirstLastName,
                                  decoration: const InputDecoration(
                                    hintText: 'Primer apellido',
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: ref(provSendDataForm)
                                      .validatorSeconLastName,
                                  focusNode: ref(provSendDataForm)
                                      .focusNodeFirstSeconName,
                                  controller: ref(provSendDataForm)
                                      .secondLastNameController,
                                  onChanged: ref(provSendDataForm)
                                      .onChangedSecondLastName,
                                  decoration: const InputDecoration(
                                    hintText: 'Segundo apellido',
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormField(
                                  focusNode: ref(provSendDataForm)
                                      .focusNodeMarriedName,
                                  onChanged: ref(provSendDataForm)
                                      .onChangedMerriedName,
                                  controller: ref(provSendDataForm)
                                      .marriedNameController,
                                  decoration: const InputDecoration(
                                    hintText: 'Apellido de casada:',
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator:
                                      ref(provSendDataForm).validatorDirection,
                                  focusNode:
                                      ref(provSendDataForm).focusNodeDirection,
                                  onChanged:
                                      ref(provSendDataForm).onChangedDirection,
                                  controller:
                                      ref(provSendDataForm).directionController,
                                  decoration: const InputDecoration(
                                    hintText: 'Direccion:',
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator:
                                      ref(provSendDataForm).validatorZone,
                                  focusNode:
                                      ref(provSendDataForm).focusNodeZone,
                                  onChanged:
                                      ref(provSendDataForm).onChangedZone,
                                  controller:
                                      ref(provSendDataForm).zoneController,
                                  decoration: const InputDecoration(
                                    hintText: 'Zona:',
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                DropdownWidget(
                                  hintText: 'Ingresa tu departamento',
                                  items: ref(provSendDataForm).departamentInfo,
                                  currentItem:
                                      ref(provSendDataForm).valueDropDown,
                                  itemCallBack: ref(provSendDataForm).onChanged,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                if (ref(provSendDataForm).isSelected)
                                  DropdownWidget(
                                    hintText: 'Ingresa tu municipio',
                                    items: ref(provSendDataForm).myArray,
                                    currentItem: ref(provSendDataForm)
                                        .valueDropDownMunicipality,
                                    itemCallBack: ref(provSendDataForm)
                                        .onChangeMunicipaity,
                                  )
                                else
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 30,
                                          ),
                                          child: Text(
                                            'Ingresa tu municipio:',
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 1,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: ref(provSendDataForm)
                                            .validatorByHeadQuarters,
                                        focusNode: ref(provSendDataForm)
                                            .focusNodeNearby,
                                        controller: ref(provSendDataForm)
                                            .nearByHeadQuartersPhoneController,
                                        onChanged: ref(provSendDataForm)
                                            .onChangedNearByHeadQuarters,
                                        decoration: const InputDecoration(
                                          hintText: 'Sede cercana:',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                TextFormField(
                                  focusNode: ref(provSendDataForm)
                                      .focusNodeDocimicilioPhone,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: ref(provSendDataForm)
                                      .validatorDomicialPhone,
                                  onChanged: ref(provSendDataForm)
                                      .onChangedDocimicilioPhone,
                                  controller: ref(provSendDataForm)
                                      .docimicilioController,
                                  decoration: const InputDecoration(
                                    hintText: 'Telefono a domicilio:',
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormField(
                                  focusNode:
                                      ref(provSendDataForm).focusNodeMobile,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator:
                                      ref(provSendDataForm).validatorMobile,
                                  onChanged:
                                      ref(provSendDataForm).onChangeMobile,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  controller:
                                      ref(provSendDataForm).mobileController,
                                  decoration: const InputDecoration(
                                    hintText: 'Celular:',
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  focusNode:
                                      ref(provSendDataForm).focusNodeEmail,
                                  onChanged:
                                      ref(provSendDataForm).onChangeEmail,
                                  controller:
                                      ref(provSendDataForm).emailController,
                                  validator:
                                      ref(provSendDataForm).validatorEmail,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    hintText: 'Correo Electronico:',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w)
                                .copyWith(bottom: 10.h),
                            child: GeneralButton(
                              onPressed: ref(provSendDataForm).validationForm()
                                  ? () =>
                                      ref(provSendDataForm).sendDataToBackEnd()
                                  : null,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );

            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
