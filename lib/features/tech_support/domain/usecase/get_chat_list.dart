import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/repository/support_repository.dart';
import 'package:fpdart/src/either.dart';

class GetChatList implements UseCase<List<String>, NoParams> {
  final SupportRepository supportRepository;
  GetChatList(this.supportRepository);
  @override
  Future<Either<Failure, List<String>>> call(
      NoParams params, String? path) async {
    return await supportRepository.getChatList();
  }
}
