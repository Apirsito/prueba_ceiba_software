import 'package:bloc/bloc.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:proyect_clean/core/errors/failure.dart';
import 'package:proyect_clean/core/globals.dart';
import 'package:proyect_clean/detail/data/models/detail_model.dart';
import 'package:proyect_clean/detail/domain/entities/detail.dart';
import 'package:proyect_clean/detail/domain/usecases/get_detail_user.dart';
import 'package:proyect_clean/users/data/models/users_model.dart';
import 'package:proyect_clean/users/domain/entities/users.dart';
import 'package:proyect_clean/users/domain/usecases/get_list_users.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  final GetDetailUser getDetailUser;
  DetailCubit(this.getDetailUser) : super(DetailInitial());

  void getNewDetailUser(int userId) async {
    emit(DetailLoading());
    final failureOrUserList = await getDetailUser(userId);

    emit(_eitherLoadedOrErrorState(failureOrUserList));
  }

  DetailState _eitherLoadedOrErrorState(
      Either<Failure, List<DetailModel>> failureOrUserList) {
    return failureOrUserList.fold(
        (failure) => DetailError(_mapFailureToMessage(failure)),
        (users) => DetailLoaded(users));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Ha ocurrido un error, por favor intenta nuevamente.';
      default:
        return 'Unexpected error';
    }
  }
}
