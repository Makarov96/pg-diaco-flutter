import 'package:flutter/material.dart';

@immutable
// ignore: must_be_immutable
class DropdownWidget extends StatefulWidget {
  DropdownWidget({
    Key? key,
    required this.items,
    required this.itemCallBack,
    required this.currentItem,
    required this.hintText,
  }) : super(key: key);

  final List<String> items;
  final ValueChanged<String> itemCallBack;
  late String currentItem;
  final String hintText;
  @override
  State<StatefulWidget> createState() => _DropdownState();
}

class _DropdownState extends State<DropdownWidget> {
  List<DropdownMenuItem<String>> dropDownItems = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: widget.currentItem,
                isExpanded: true,
                items: widget.items
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (selectedItem) => setState(() {
                  widget.currentItem = selectedItem.toString();
                  widget.itemCallBack(widget.currentItem);
                }),
                hint: Text(
                  widget.hintText,
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
