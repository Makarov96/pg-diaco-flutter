import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralButtonForm extends StatelessWidget {
  const GeneralButtonForm({
    Key? key,
    required this.onPressed,
    required this.textValue,
  }) : super(key: key);
  final void Function()? onPressed;
  final String textValue;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.sp),
          ),
        ),
      ),
      child: SizedBox(
        width: 150.w,
        height: 30.h,
        child: Center(
          child: Text(
            textValue,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
