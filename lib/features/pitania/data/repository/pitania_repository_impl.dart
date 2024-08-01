import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/pitania/data/data_source/pitania_data_source.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/entities/pitania_entity.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/entities/pitania_meta_entity.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/repository/pitania_repository.dart';
import 'package:fpdart/fpdart.dart';

class PitaniaRepositoryImpl implements PitaniaRepository {
  final PitaniaDataSource pitaniaDataSource;
  PitaniaRepositoryImpl(this.pitaniaDataSource);
  @override
  Future<Either<Failure, List<PitaniaEntity>>> getPitaniaList(int page) async {
    return _getPitaniaList(
        () async => await pitaniaDataSource.getAllPitaniaList(page));
  }

  Future<Either<Failure, List<PitaniaEntity>>> _getPitaniaList(
      Future<List<PitaniaEntity>> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, PitaniaMetaEntity>> getPitaniaCount(
      int? isFoodFree, int? classAt, int? classTo) async {
    return _getPitaniaCount(() async =>
        await pitaniaDataSource.getPitaniaCount(isFoodFree, classAt, classTo));
  }

  Future<Either<Failure, PitaniaMetaEntity>> _getPitaniaCount(
      Future<PitaniaMetaEntity> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }
}
