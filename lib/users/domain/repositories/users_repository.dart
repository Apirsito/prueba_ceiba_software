import 'package:dartz/dartz.dart';
import 'package:proyect_clean/core/errors/failure.dart';
import 'package:proyect_clean/users/data/models/users_model.dart';

abstract class UsersRepository {
  Future<Either<Failure, List<UsersModel>>> getListUsers();
}
