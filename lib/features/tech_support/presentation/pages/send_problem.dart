import 'package:direcrot_mobile_new/core/common/widgets/button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CreateTicket extends StatefulWidget {
  const CreateTicket({super.key});

  @override
  State<CreateTicket> createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {
  String textController = '';
  // final FocusNode _focusNode = FocusNode();
  // void _requestFocus() {
  //   FocusScope.of(context).requestFocus(_focusNode);
  // }

  TextEditingController topic = TextEditingController();
  TextEditingController content = TextEditingController();

  int teacher = 0;
  int parent = 0;
  int student = 0;

  int? selectedValue1;
  bool all = false;
  bool students = false;
  bool teachers = false;
  bool parrents = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'title_notif'.tr(),
                    style: TextStyle(
                      color: Color(0xFF1D1F23),
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  CupertinoTextField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: topic,
                    padding: EdgeInsets.all(15),
                    placeholder: 'enter_text'.tr(),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFBBBBBB))),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'mazmun'.tr(),
                    style: TextStyle(
                      color: Color(0xFF1D1F23),
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  TextField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    controller: content,
                    onChanged: (value) {
                      setState(() {});
                    },
                    keyboardType: TextInputType.multiline,
                    autofocus: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'enter_content'.tr(),
                      hintStyle: TextStyle(
                        color: Color(0xFFBBBBBB),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.w,
                          color: Color(0xFFBBBBBB),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.w,
                          color: Color(0xFFBBBBBB),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'list_grup',
                    style: TextStyle(
                      color: Color(0xFF1D1F23),
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: Color(0xFFBBBBBB))),
                        child: CupertinoButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 12.h),
                            color: Color(0xFFF8F8FD),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'add_file',
                                  style: TextStyle(
                                    color: Color(0xFF7A7A7A),
                                    fontSize: 15.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // SvgPicture.asset('images/scr.svg')
                              ],
                            ),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                  // if (state.imageName.isNotEmpty)
                  //   for (int i = 0; i < state.imageName.length; i++)
                  //     Container(
                  //       margin: EdgeInsets.only(bottom: 10.h),
                  //       decoration: BoxDecoration(
                  //           color: const Color(0xFFD9D9D9),
                  //           borderRadius: BorderRadius.circular(10.r)),
                  //       child: Padding(
                  //         padding: EdgeInsets.symmetric(
                  //             vertical: 8.0.h, horizontal: 8.0.w),
                  //         child: Text(state.imageName[i]),
                  //       ),
                  //     ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: AppButton(title: 'data', pressAction: () {}))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
