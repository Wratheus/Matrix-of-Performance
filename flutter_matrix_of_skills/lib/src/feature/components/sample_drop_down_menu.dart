// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class SampleDropDownMenu extends StatefulWidget {
  List<String> values;
  late String selectedValue;
  String? controllerSelectedValue;
  bool isExpanded;
  final Function(String?)? onChanged;
  SampleDropDownMenu({super.key, required this.values, required this.isExpanded, this.onChanged, this.controllerSelectedValue}) {
    (controllerSelectedValue == null) ? selectedValue = values[0] : selectedValue = controllerSelectedValue!;
  }
  @override
  State<SampleDropDownMenu> createState() => _SampleDropDownMenuState();
}

class _SampleDropDownMenuState extends State<SampleDropDownMenu> {

  dropDownCallBack(String? dropDownValue) {
    if (dropDownValue is String) {
      setState(() {
        widget.selectedValue = dropDownValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: MyColors.customBlack.withOpacity(0.35),
              blurRadius: 4,
            ),
          ],
          color: MyColors.mainOuterColor,
          border: Border.all(color: MyColors.mainBeige.withOpacity(0.4), width:2), //border of dropdown button
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(8.0),
              icon: const Icon(Icons.keyboard_arrow_down_outlined, color: MyColors.mainBeige),
              isExpanded: widget.isExpanded,
              style: whiteTextColor,
              focusColor: MyColors.mainOuterColor,
              iconDisabledColor: MyColors.mainOuterColor,
              iconEnabledColor: MyColors.mainOuterColor,
              dropdownColor: MyColors.mainOuterColor,
              underline: Container(),
              value: widget.selectedValue,
              items: widget.values.map((item) =>
                  DropdownMenuItem<String>(
                      value: item,
                      child: Row(
                        children: [
                          Text(item, style: whiteTextColor),
                        ],
                      )
                  )
              ).toList(),
              onChanged: (item) => widget.onChanged!(item) ?? dropDownCallBack(item),
            ),
        ),
      ),
    );
  }
}
