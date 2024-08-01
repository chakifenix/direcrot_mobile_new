import 'package:direcrot_mobile_new/features/auth/domain/entities/iin_answer.dart';

class IinAnswerModel extends IinAnswer {
  IinAnswerModel({required super.message, required super.email});

  factory IinAnswerModel.fromjson(Map<String, dynamic> map) {
    return IinAnswerModel(
      message: map['message'] ?? '',
      email: map['email'] ?? '',
    );
  }

  IinAnswerModel copyWith({
    String? message,
    String? email,
  }) {
    return IinAnswerModel(
      message: message ?? this.message,
      email: email ?? this.email,
    );
  }
}
