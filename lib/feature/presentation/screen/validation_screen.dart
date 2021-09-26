import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pg_diaco_complaints/core/const/text_style.dart';
import 'package:pg_diaco_complaints/core/const/value_string.dart';
import 'package:pg_diaco_complaints/di_container.dart';

import 'package:pg_diaco_complaints/feature/presentation/screen/screen_by_anonymous.dart';
import 'package:pg_diaco_complaints/feature/presentation/screen/screen_form_by_user.dart';
import 'package:pg_diaco_complaints/widgets/general_button_form.dart';

class ValidationScreen extends StatelessWidget {
  const ValidationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titleValidation,
              style: titleTexFormtStyle,
            ),
            Text(
              descriptionValidation,
              style: descTexFormtStyle,
            ),
            SizedBox(
              height: 35.h,
            ),
            GeneralButtonForm(
              onPressed: () async {
                await context
                    .read(provCreateAnonymousUser)
                    .createAnonymousUserBloc();
                await Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ScreenByAnonymous(),
                  ),
                );
              },
              textValue: 'Queja anonima',
            ),
            SizedBox(
              height: 20.h,
            ),
            GeneralButtonForm(
              onPressed: () => Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (_) => const ScreenFormByUser(),
                ),
              ),
              textValue: 'Con datos personales',
            ),
          ],
        ),
      ),
    );
  }
}
