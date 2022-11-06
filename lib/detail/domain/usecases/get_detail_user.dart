import 'package:dartz/dartz.dart';
import 'package:proyect_clean/core/errors/failure.dart';
import 'package:proyect_clean/detail/data/models/detail_model.dart';
import 'package:proyect_clean/detail/domain/repositories/detail_repository.dart';

class GetDetailUser {
  final DetailRepository userRepository;

  GetDetailUser(this.userRepository);

  Future<Either<Failure, List<DetailModel>>> call(int user) async {
    return userRepository.getDetailUser(user);
  }
}
