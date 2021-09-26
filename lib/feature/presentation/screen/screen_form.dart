import 'package:flutter/material.dart';
import 'package:pg_diaco_complaints/feature/presentation/widgets/form.dart';

class ScreenForm extends StatelessWidget {
  const ScreenForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Consumidor'),
      ),
      body: const Center(
        child: FormWidget(),
      ),
    );
  }
}
