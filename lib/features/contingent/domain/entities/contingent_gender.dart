import 'package:equatable/equatable.dart';

class ContingentGender extends Equatable {
  final int maleCount;
  final int femaleCount;

  const ContingentGender({required this.maleCount, required this.femaleCount});

  @override
  List<Object?> get props => [maleCount, femaleCount];
}
