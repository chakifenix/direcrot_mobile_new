import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/entities/pass_entity.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/repository/profile_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/internet_services/error/failure.dart';

class GetPassInfo implements UseCase<List<PassEntity>, PassUserIdParams> {
  final ProfileRepository profileRepository;
  GetPassInfo(this.profileRepository);
  @override
  Future<Either<Failure, List<PassEntity>>> call(
      PassUserIdParams params, String? path) async {
    return await profileRepository.getPassData(params.id);
  }
}

class PassUserIdParams {
  PassUserIdParams({required this.id});
  final int id;
}
