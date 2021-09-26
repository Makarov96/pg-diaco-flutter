import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pg_diaco_complaints/core/conf/config_reader.dart';
import 'package:pg_diaco_complaints/feature/presentation/screen/validation_screen.dart';

Future<void> main() async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();
  // Load the JSON config into memory
  await ConfigReader.initialize();

  runApp(const ProviderScope(child: MyApp()));
}

///Initial app method
class MyApp extends StatelessWidget {
  ///Initial app method
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ValidationScreen(),
        );
      },
    );
  }
}
