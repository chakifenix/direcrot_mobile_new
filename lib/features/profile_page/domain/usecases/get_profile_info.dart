import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/entities/profile_entity.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/repository/profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProfileInfo implements UseCase<ProfileEntity, UserId> {
  final ProfileRepository profileRepository;
  GetProfileInfo(this.profileRepository);
  @override
  Future<Either<Failure, ProfileEntity>> call(
      UserId params, String? path) async {
    return await profileRepository.getProfileInfo(params.id);
  }
}

class UserId {
  UserId({required this.id});
  final int id;
}
