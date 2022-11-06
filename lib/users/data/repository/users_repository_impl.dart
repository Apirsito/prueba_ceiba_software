import 'package:dartz/dartz.dart';
import 'package:proyect_clean/core/errors/exceptions.dart';
import 'package:proyect_clean/core/errors/failure.dart';
import 'package:proyect_clean/users/data/datasources/users_remote_datasource.dart';
import 'package:proyect_clean/users/data/models/users_model.dart';
import 'package:proyect_clean/users/domain/repositories/users_repository.dart';

class UsersRepositpryImpl implements UsersRepository {
  final UsersRemoteDataSource remoteDataSource;

  UsersRepositpryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<UsersModel>>> getListUsers() async {
    try {
      final users = await remoteDataSource.getListUser();
      return Right(users);
    } on ServerException {
      return Left(
        ServerFailure(
            message: 'Ha ocurrido un error al obtener los datos del servidor'),
      );
    }
  }
}
