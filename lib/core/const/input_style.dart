import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const inputTitle = InputDecoration(
  hintText: 'Titulo',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
);

final inputDecription = InputDecoration(
  hintText: 'descripcion',
  hintStyle: const TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5.0.sp),
    ),
  ),
);
