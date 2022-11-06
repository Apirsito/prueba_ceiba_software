import 'package:dartz/dartz.dart';
import 'package:proyect_clean/core/errors/failure.dart';
import 'package:proyect_clean/detail/data/models/detail_model.dart';

abstract class DetailRepository {
  Future<Either<Failure, List<DetailModel>>> getDetailUser(int user);
}
