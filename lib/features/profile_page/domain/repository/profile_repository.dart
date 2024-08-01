import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/entities/pass_entity.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/entities/profile_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfileInfo(int id);
  Future<Either<Failure, List<PassEntity>>> getPassData(int id);
}
