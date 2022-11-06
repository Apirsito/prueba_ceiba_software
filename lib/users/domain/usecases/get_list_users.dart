import 'package:dartz/dartz.dart';
import 'package:proyect_clean/core/errors/failure.dart';
import 'package:proyect_clean/users/data/models/users_model.dart';
import 'package:proyect_clean/users/domain/repositories/users_repository.dart';

class GetListUser {
  final UsersRepository userRepository;

  GetListUser(this.userRepository);

  Future<Either<Failure, List<UsersModel>>> call() async {
    return userRepository.getListUsers();
  }
}
