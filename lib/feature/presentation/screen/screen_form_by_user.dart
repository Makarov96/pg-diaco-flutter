import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pg_diaco_complaints/feature/presentation/widgets/form.dart';
import 'package:pg_diaco_complaints/feature/presentation/widgets/form_mobile.dart';

class ScreenFormByUser extends StatelessWidget {
  const ScreenFormByUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Consumidor'),
      ),
      body: const Center(
        child: kIsWeb ? FormWidget() : FormMobileWidget(),
      ),
    );
  }
}
