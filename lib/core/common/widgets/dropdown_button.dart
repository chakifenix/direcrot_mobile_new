import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownButtonCustom extends StatelessWidget {
  const DropdownButtonCustom(
      {super.key,
      required this.items,
      required this.selectedValue,
      required this.onChanged,
      required this.hintTitle});

  final Function(int?) onChanged;

  final List<Map<String, dynamic>> items;
  final int? selectedValue;
  final String hintTitle;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<int>(
        isExpanded: true,
        iconStyleData: IconStyleData(
            icon: Container(
          height: 30.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8.r),
                  topRight: Radius.circular(8.r))),
          child: Image.asset('images/down.png'),
        )),
        hint: Row(
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  hintTitle,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        items: items
            .map((item) => DropdownMenuItem<int>(
                  value: item['value'],
                  child: Text(
                    item['name'],
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 30.h,
          // width: 270.w,
          padding: const EdgeInsets.only(
            left: 14,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: const Color(0xFFD9D9D9),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 250,
          width: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xFFD9D9D9),
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
