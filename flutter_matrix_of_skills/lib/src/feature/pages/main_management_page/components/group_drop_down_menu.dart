// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_matrix_of_skills/src/feature/pages/main_management_page/components/group_table_view_controller.dart';

import '../../../../core/constants/constants.dart';
import '../../../cubit/user_data/user_data_cubit.dart';

class GroupDropDownMenu extends StatefulWidget {

  final TableController tableController;
  List<dynamic> values = [];


  GroupDropDownMenu({Key? key, required this.tableController}) : super(key: key);
  @override
  State<GroupDropDownMenu> createState() => _GroupDropDownMenuState();
}

class _GroupDropDownMenuState extends State<GroupDropDownMenu> {
  List<Map>? selectedTableData;
  dropDownCallBack(String? dropDownValue) {
    if (dropDownValue is String) {
      setState(() {
        widget.tableController.selectedValue = dropDownValue;
        widget.tableController.update(tableName: widget.tableController.selectedValue, selectedValue: widget.tableController.selectedValue);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if ((state as UserDataLoadedState).values.isEmpty == false) {
          widget.values = state.values;
          widget.tableController.selectedValue ??= state.values[0]['table_name'];
          return DropdownButton<String>(
            style: whiteTextColor,
            dropdownColor: MyColors.mainInnerColor,
            value: widget.tableController.selectedValue,
            items: state.values.map((item) =>
                DropdownMenuItem<String>(
                    value: item['table_name'],
                    child: Row(
                      children: [
                        Text(item['table_name'], style: whiteTextColor),
                      ],
                    )
                )
            ).toList(),
            onChanged: (item) => dropDownCallBack(item),
          );
        }
        else {
          return const SizedBox(height: 20);
        }
      }
    );
  }
}