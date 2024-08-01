import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/profile_page/data/data_source/profile_data_source.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/entities/pass_entity.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/entities/profile_entity.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/repository/profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource profileDataSource;
  ProfileRepositoryImpl(this.profileDataSource);
  @override
  Future<Either<Failure, ProfileEntity>> getProfileInfo(int id) async {
    return _getProfileInfo(
        () async => await profileDataSource.getProfileData(id));
  }

  Future<Either<Failure, ProfileEntity>> _getProfileInfo(
      Future<ProfileEntity> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<PassEntity>>> getPassData(int id) {
    return _getPassData(() async => await profileDataSource.getPassData(id));
  }

  Future<Either<Failure, List<PassEntity>>> _getPassData(
      Future<List<PassEntity>> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }
}
