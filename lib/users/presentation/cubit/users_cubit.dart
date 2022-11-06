import 'package:bloc/bloc.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:proyect_clean/core/errors/failure.dart';
import 'package:proyect_clean/core/globals.dart';
import 'package:proyect_clean/users/data/models/users_model.dart';
import 'package:proyect_clean/users/domain/entities/users.dart';
import 'package:proyect_clean/users/domain/usecases/get_list_users.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final GetListUser getListUser;
  UsersCubit(this.getListUser) : super(UsersInitial());

  void getNewListUser() async {
    emit(UsersLoading());
    final failureOrUserList = await getListUser();

    emit(_eitherLoadedOrErrorState(failureOrUserList));
  }

  void searchUsers(String userText) async {
    if (userText.isNotEmpty) {
      final suggestions = Globals.listUser
          .where((element) => element.name.contains(userText))
          .toList();
      emit(UsersLoaded(suggestions));
    } else {
      emit(UsersLoaded(Globals.listUser));
    }
  }

  UsersState _eitherLoadedOrErrorState(
      Either<Failure, List<UsersModel>> failureOrUserList) {
    return failureOrUserList
        .fold((failure) => UsersError(_mapFailureToMessage(failure)), (users) {
      Globals.listUser = users;
      return UsersLoaded(users);
    });
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
