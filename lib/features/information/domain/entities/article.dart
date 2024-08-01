// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String? id;
  final String? referal;
  final String? lang;
  final String? menu;
  final String? submenu;
  final String? title;
  final String? annot;
  final String? text;
  final String? filename;
  final String? images;
  final String? attachments;
  final DateTime? date;
  final String? time;
  final DateTime? datetime;
  final String? views;
  final String? moderator;
  final String? ip;
  final dynamic browser;
  final String? status;

  Article({
    required this.id,
    required this.referal,
    required this.lang,
    required this.menu,
    required this.submenu,
    required this.title,
    required this.annot,
    required this.text,
    required this.filename,
    required this.images,
    required this.attachments,
    required this.date,
    required this.time,
    required this.datetime,
    required this.views,
    required this.moderator,
    required this.ip,
    required this.browser,
    required this.status,
  });

  @override
  List<Object?> get props {
    return [
      id,
      referal,
      lang,
      menu,
      submenu,
      title,
      annot,
      text,
      filename,
      images,
      attachments,
      date,
      time,
      datetime,
      views,
      moderator,
      ip,
      browser,
      status
    ];
  }
}
