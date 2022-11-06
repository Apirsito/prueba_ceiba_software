import 'package:dartz/dartz.dart';
import 'package:proyect_clean/core/errors/exceptions.dart';
import 'package:proyect_clean/core/errors/failure.dart';
import 'package:proyect_clean/detail/data/datasources/detail_remote_datasource.dart';
import 'package:proyect_clean/detail/data/models/detail_model.dart';
import 'package:proyect_clean/detail/domain/repositories/detail_repository.dart';

class DetailRepositpryImpl implements DetailRepository {
  final DetailRemoteDataSource remoteDataSource;

  DetailRepositpryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<DetailModel>>> getDetailUser(int user) async {
    try {
      final userDetail = await remoteDataSource.getDetailUser(user);
      return Right(userDetail);
    } on ServerException {
      return Left(
        ServerFailure(
            message: 'Ha ocurrido un error al obtener los datos del servidor'),
      );
    }
  }
}
