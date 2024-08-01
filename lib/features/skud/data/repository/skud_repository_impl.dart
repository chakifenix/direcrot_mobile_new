import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/skud/data/data_source/skud_data_source.dart';
import 'package:direcrot_mobile_new/features/skud/domain/entities/skud_entity.dart';
import 'package:direcrot_mobile_new/features/skud/domain/repository/skud_repository.dart';
import 'package:fpdart/fpdart.dart';

class SkudRepositoryImpl implements SkudRepository {
  final SkudDataSource skudDataSource;
  SkudRepositoryImpl(this.skudDataSource);
  @override
  Future<Either<Failure, List<SkudEntity>>> getSkudList(int page) {
    return _getSkudList(
      () async => await skudDataSource.getAllSkudList(page),
    );
  }

  Future<Either<Failure, List<SkudEntity>>> _getSkudList(
      Future<List<SkudEntity>> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }
}
