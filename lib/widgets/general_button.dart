import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.sp),
          ),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 30.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enviar'),
          ],
        ),
      ),
    );
  }
}
