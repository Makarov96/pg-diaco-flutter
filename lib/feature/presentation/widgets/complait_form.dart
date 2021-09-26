import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pg_diaco_complaints/core/const/input_style.dart';
import 'package:pg_diaco_complaints/core/const/text_style.dart';
import 'package:pg_diaco_complaints/core/const/value_string.dart';
import 'package:pg_diaco_complaints/di_container.dart';
import 'package:pg_diaco_complaints/feature/presentation/bloc/complait_form_bloc.dart';
import 'package:pg_diaco_complaints/feature/presentation/screen/validation_screen.dart';
import 'package:pg_diaco_complaints/widgets/dialog/general_dialog.dart';
import 'package:pg_diaco_complaints/widgets/general_button.dart';

class ComplaitForm extends StatelessWidget {
  const ComplaitForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<ComplaitFormBloc>(
      onChange: (contex, state) {
        if (state.stateofformcomplait == STATEOFFORMCOMPLAIT.failure) {
          return showAlertDialog(
            context: contex,
            valueTextButton: 'Aceptar',
            title: 'Alerta',
            content: 'Al parecer algo a salido mal',
            onPressed: () {
              state.resetState();
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (_) => const ValidationScreen(),
                ),
              );
            },
          );
        } else if (state.stateofformcomplait == STATEOFFORMCOMPLAIT.success) {
          return showAlertDialog(
            context: contex,
            valueTextButton: 'Aceptar',
            title: 'Accion realizada con exito',
            content: '',
            onPressed: () {
              state.resetState();
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (_) => const ValidationScreen(),
                ),
              );
            },
          );
        } else if (state.stateofformcomplait == STATEOFFORMCOMPLAIT.inProcess) {
          return showLoadingDialog(
            context: context,
            title: 'Cargando...',
            content: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      provider: provComplaitForm,
      child: Container(
        padding: kIsWeb
            ? EdgeInsets.symmetric(horizontal: 80.w)
            : EdgeInsets.symmetric(horizontal: 10.w),
        constraints: BoxConstraints(maxWidth: 300.w),
        child: Center(
          child: Consumer(
            builder: (context, ref, child) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      descriptionComplait,
                      style: titleTexFormtStyle,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextField(
                      controller: ref(provComplaitForm).titleController,
                      onChanged: ref(provComplaitForm).onChangedTitle,
                      decoration: inputTitle,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextField(
                      controller: ref(provComplaitForm).descriptionController,
                      onChanged: ref(provComplaitForm).onChangedDesc,
                      minLines: 5,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      decoration: inputDecription,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    GeneralButton(
                      onPressed: ref(provComplaitForm).validationForm()
                          ? () => ref(provComplaitForm).submitAction()
                          : null,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
