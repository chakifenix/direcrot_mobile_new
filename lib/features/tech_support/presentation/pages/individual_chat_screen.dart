import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/features/tech_support/data/models/chat_list_model.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/chat_list_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/bloc/support_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IndividualScreen extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;
  final String fullName;
  final String initMessage;
  final String ticketId;
  final DateTime createdAt;
  final int statusId;
  IndividualScreen(
      {super.key,
      required this.receiverEmail,
      required this.receiverID,
      required this.fullName,
      required this.initMessage,
      required this.ticketId,
      required this.createdAt,
      required this.statusId});

  @override
  State<IndividualScreen> createState() => _IndividualScreenState();
}

class _IndividualScreenState extends State<IndividualScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<ChatListEntity> _chatList = [];
  int orderNum = 1;

  // chat & auth services
  void sendMessage() async {
    // if there is something inside the textfield
    if (_messageController.text.isNotEmpty) {
      final messageText = _messageController.text;

      setState(() {
        _chatList.add(ChatListModel(
            id: 1,
            ticketUid: '1',
            createdByType: 1,
            messageBody: messageText,
            orderNum: orderNum + 1,
            evaluation: 1,
            createdAt: widget.createdAt,
            createdByName: 'Name'));
      });
      // send the message
      context
          .read<SupportBloc>()
          .add(SendMessageFetch(_messageController.text, '1', widget.ticketId));
      // clear text controller
      _messageController.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<SupportBloc>().add(GetChatListFetch(widget.ticketId));
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
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
          // leading: GestureDetector(
          //   onTap: () => Navigator.pop(context),
          //   child: Transform.scale(
          //     scale: 0.5,
          //     child: SvgPicture.asset(
          //       'images/left.svg',
          //     ),
          //   ),
          // ),
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
                    'manager'.tr(),
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
      body: BlocBuilder<SupportBloc, SupportState>(
        builder: (BuildContext context, SupportState state) {
          if (state.isDetailSuccess) {
            _chatList = state.chatList;
            if (orderNum == 1 && state.chatList.isNotEmpty) {
              orderNum = state.chatList[state.chatList.length - 1].orderNum;
            }

            return Column(children: [
              Expanded(
                child: Container(
                    child: Padding(
                        padding:
                            EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
                        child: _buildMessageList(_chatList, widget.createdAt))),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 14.h, bottom: 10.h),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(top: BorderSide(color: Color(0xFFEDF2F6)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //     width: 42.w,
                    //     height: 42.h,
                    //     padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(12.r),
                    //         color: Color(0xFFEDF2F6)),
                    //     child: SvgPicture.asset('images/skrepka.svg')),
                    Expanded(
                      child: Container(
                          height: 42.h,
                          decoration: BoxDecoration(
                              color: Color(0xFFEDF2F6),
                              borderRadius: BorderRadius.circular(12.r)),
                          child: TextField(
                            enabled: (widget.statusId == 4) ? false : true,
                            style: TextStyle(color: Colors.black),
                            controller: _messageController,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                contentPadding:
                                    EdgeInsets.only(left: 12.w, right: 10.w),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                hintText: 'Печатать',
                                prefixIconColor: Colors.grey),
                          )),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: sendMessage,
                      child: Container(
                          width: 42.w,
                          height: 42.h,
                          padding: EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 6.w),
                          decoration: BoxDecoration(
                              color: Color(0xFFEDF2F6),
                              borderRadius: BorderRadius.circular(12.r)),
                          child: SvgPicture.asset('images/sendIcon.svg')),
                    )
                  ],
                ),
              )
            ]);
          }
          if (state.isFailure) {
            return Center(
              child: Text(state.error ?? ''),
            );
          }
          return Loader();
        },
      ),
    );
  }

  Widget _buildMessageList(List<ChatListEntity> messages, DateTime createdAt) {
    List<ChatListEntity> displayMessages = [
          ChatListEntity(
              id: 1,
              ticketUid: '1',
              createdByType: 1,
              messageBody: widget.initMessage,
              orderNum: 3,
              evaluation: 1,
              createdAt: createdAt,
              createdByName: 'name')
        ] +
        messages;
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
    return ListView.builder(
        reverse: true,
        itemCount: displayMessages.length,
        itemBuilder: (context, index) {
          int messageIndex = displayMessages.length - 1 - index;

          DateTime currentDate = displayMessages[messageIndex].createdAt;
          DateTime? nextDate = messageIndex > 0
              ? displayMessages[messageIndex - 1].createdAt
              : null;

          String currentFormattedDate =
              DateFormat('dd.MM.yyyy').format(currentDate);
          String? nextFormatDate = nextDate != null
              ? DateFormat('dd.MM.yyyy').format(nextDate)
              : null;

          bool showDate = currentFormattedDate == nextFormatDate;
          print('$index $currentFormattedDate $nextFormatDate');
          return Column(
            children: [
              if (showDate == false) ...[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 140.w,
                        height: 2.h,
                        color: Color(0xFFEDF2F6),
                      ),
                      Text(
                        DateFormat('dd.MM.yyyy')
                            .format(displayMessages[messageIndex].createdAt),
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
              Container(
                child: _buildMessageItem(displayMessages[messageIndex]),
              ),
            ],
          );
        });
    // return ListView(
    //   reverse: true,
    //   children: [
    //     for (int i = displayMessages.length - 1; i >= 0; i--)
    //       Container(
    //         child: _buildMessageItem(displayMessages[i]),
    //       ),
    //     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //       Container(
    //         width: 140.w,
    //         height: 2.h,
    //         color: Color(0xFFEDF2F6),
    //       ),
    //       Text(
    //         '18.01.24',
    //         style: TextStyle(
    //           color: Color(0xFF9DB6CA),
    //           fontSize: 13.sp,
    //           fontFamily: 'Gilroy',
    //           fontWeight: FontWeight.w600,
    //           height: 0,
    //         ),
    //       ),
    //       Container(
    //         width: 140.w,
    //         height: 2.h,
    //         color: Color(0xFFEDF2F6),
    //       ),
    //     ]),
    //   ],
    // );
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
  }

  // build message input
  Widget _buildMessageItem(ChatListEntity message) {
    // Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser = message.createdByType == 1;

    return BubbleSpecialThree(
      text: message.messageBody,
      color: isCurrentUser ? Color(0xFF3BEC78) : Color(0xFFEDF2F6),
      tail: true,
      isSender: isCurrentUser,
      textStyle: TextStyle(
        color: Color(0xFF2B333E),
        fontSize: 14.sp,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        height: 0,
      ),
    );
  }
}
