import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/chat_send_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/repository/support_repository.dart';
import 'package:fpdart/src/either.dart';

class SendMessage implements UseCase<ChatSendEntity, SendMessageParams> {
  final SupportRepository supportRepository;
  SendMessage(this.supportRepository);
  @override
  Future<Either<Failure, ChatSendEntity>> call(
      SendMessageParams params, String? path) async {
    return await supportRepository.sendChat(
        params.message, params.orderNum, path!);
  }
}

class SendMessageParams {
  final String message;
  final String orderNum;
  SendMessageParams(this.message, this.orderNum);
}
