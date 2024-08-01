import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/main/domain/entities/today_stats.dart';
import 'package:direcrot_mobile_new/features/main/domain/repositories/main_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetTodayStats implements UseCase<TodayStats, NoParams> {
  final MainRepository mainRepository;
  GetTodayStats(this.mainRepository);

  @override
  Future<Either<Failure, TodayStats>> call(
      NoParams params, String? path) async {
    return await mainRepository.getTodayStats();
  }
}
