import 'package:flutter/material.dart';
import 'package:pg_diaco_complaints/core/const/text_style.dart';

class GeneralRadiosButton extends StatelessWidget {
  const GeneralRadiosButton({
    Key? key,
    required this.onChanged,
    required this.textValue,
    required this.value,
  }) : super(key: key);
  final void Function(bool?)? onChanged;
  final String textValue;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text(
          textValue,
          style: generalTextStyle,
        )
      ],
    );
  }
}
