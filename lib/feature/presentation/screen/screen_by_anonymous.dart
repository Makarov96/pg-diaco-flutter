import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pg_diaco_complaints/di_container.dart';
import 'package:pg_diaco_complaints/feature/presentation/bloc/anonymous_user_bloc.dart';
import 'package:pg_diaco_complaints/feature/presentation/widgets/complait_form.dart';

class ScreenByAnonymous extends StatelessWidget {
  const ScreenByAnonymous({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const LayoutByAnonymousUser(),
    );
  }
}

class LayoutByAnonymousUser extends StatelessWidget {
  const LayoutByAnonymousUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, child) {
        switch (ref(provCreateAnonymousUser).statusofcreateanonymoususer) {
          case STATUSOFCREATEANONYMOUSUSER.failure:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case STATUSOFCREATEANONYMOUSUSER.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case STATUSOFCREATEANONYMOUSUSER.success:
            return const Center(
              child: ComplaitForm(),
            );

          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
