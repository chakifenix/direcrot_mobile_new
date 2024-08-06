import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/repository/support_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:image_picker/image_picker.dart';

class CreateTicket implements UseCase<String, CreateTicketParams> {
  final SupportRepository supportRepository;
  CreateTicket(this.supportRepository);
  @override
  Future<Either<Failure, String>> call(
      CreateTicketParams params, String? path) async {
    return await supportRepository.createTicket(
        params.initMessage, params.title, params.files);
  }
}

class CreateTicketParams {
  final String initMessage;
  final String title;
  final List<XFile> files;

  CreateTicketParams(
      {required this.initMessage, required this.title, required this.files});
}
