import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IndividualScreen extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  final String fullName;
  IndividualScreen(
      {super.key,
      required this.receiverEmail,
      required this.receiverID,
      required this.fullName});

  final TextEditingController _messageController = TextEditingController();

  // chat & auth services


  // send message
  void sendMessage() async {
    // if there is something inside the textfield
    if (_messageController.text.isNotEmpty) {
      // send the message

      // clear text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 1,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Transform.scale(
              scale: 0.5,
              child: SvgPicture.asset(
                'images/left.svg',
              ),
            ),
          ),
          title: Row(
            children: [
              CircleAvatar(
                radius: 25.r,
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'fullName',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Text(
                    'online',
                    style: TextStyle(
                      color: Color(0xFF5D7A90),
                      fontSize: 12.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
              child: Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
                  child: ListView(
          reverse: true,
          children: [
            for (int i = 5 - 1; i >= 0; i--)
              Container(
                child: Text('data'),
              ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                width: 140.w,
                height: 2.h,
                color: Color(0xFFEDF2F6),
              ),
              Text(
                '18.01.24',
                style: TextStyle(
                  color: Color(0xFF9DB6CA),
                  fontSize: 13.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              Container(
                width: 140.w,
                height: 2.h,
                color: Color(0xFFEDF2F6),
              ),
            ]),
          ],
        ))),
        ),
        Container(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, top: 14.h, bottom: 44.h),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(top: BorderSide(color: Color(0xFFEDF2F6)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 42.w,
                  height: 42.h,
                  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Color(0xFFEDF2F6)),
                  child: SvgPicture.asset('images/skrepka.svg')),
              Container(
                  width: 235.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                      color: Color(0xFFEDF2F6),
                      borderRadius: BorderRadius.circular(12.r)),
                  child: TextField(
                    controller: _messageController,
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        contentPadding:
                            EdgeInsets.only(left: 12.w, right: 10.w),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Поиск',
                        prefixIconColor: Colors.grey),
                  )),
              GestureDetector(
                onTap: sendMessage,
                child: Container(
                    width: 42.w,
                    height: 42.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
                    decoration: BoxDecoration(
                        color: Color(0xFFEDF2F6),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: SvgPicture.asset('images/Audio.svg')),
              )
            ],
          ),
        )
      ]),
    );
  }

  // Widget _buildMessageList() {
  //   String senderID = _authService.getCurrentsUser()!.uid;
  //   return StreamBuilder(
  //     stream: _chatService.getMessages(receiverID, senderID),
  //     builder: (context, snapshot) {
  //       // errors
  //       if (snapshot.hasError) {
  //         return const Text("Error");
  //       }

  //       //loading
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Text("Loading");
  //       }

  //       // return list view
  //       List<Widget> a =
  //           snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList();
  //       a.reversed;
  //       return ListView(
  //         reverse: true,
  //         children: [
  //           for (int i = a.length - 1; i >= 0; i--)
  //             Container(
  //               child: a[i],
  //             ),
  //           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //             Container(
  //               width: 140.w,
  //               height: 2.h,
  //               color: Color(0xFFEDF2F6),
  //             ),
  //             Text(
  //               '18.01.24',
  //               style: TextStyle(
  //                 color: Color(0xFF9DB6CA),
  //                 fontSize: 13.sp,
  //                 fontFamily: 'Gilroy',
  //                 fontWeight: FontWeight.w600,
  //                 height: 0,
  //               ),
  //             ),
  //             Container(
  //               width: 140.w,
  //               height: 2.h,
  //               color: Color(0xFFEDF2F6),
  //             ),
  //           ]),
  //         ],
  //       );
  //       // return ListView.builder(
  //       //   itemCount: a.length,
  //       //   reverse: true,
  //       //   itemBuilder: (context, index) {
  //       //     return Container(
  //       //       child: a[a.length - (index + 1)],
  //       //     );
  //       //   },
  //       // );
  //     },
  //   );
  // }

  // build message input
  // Widget _buildMessageItem(DocumentSnapshot doc) {
  //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

  //   // is current user
  //   bool isCurrentUser =
  //       data['senderId'] == _authService.getCurrentsUser()!.uid;

  //   return BubbleSpecialThree(
  //     text: data["message"],
  //     color: isCurrentUser ? Color(0xFF3BEC78) : Color(0xFFEDF2F6),
  //     tail: true,
  //     isSender: isCurrentUser,
  //     textStyle: TextStyle(
  //       color: Color(0xFF2B333E),
  //       fontSize: 14.sp,
  //       fontFamily: 'Gilroy',
  //       fontWeight: FontWeight.w500,
  //       height: 0,
  //     ),
  //   );
  // }

  // build message input
}
