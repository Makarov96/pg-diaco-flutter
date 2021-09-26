import 'package:flutter/material.dart';
import 'package:pg_diaco_complaints/feature/presentation/widgets/complait_form.dart';

class ComplaitFormScreen extends StatelessWidget {
  const ComplaitFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ComplaitForm(),
      ),
    );
  }
}
