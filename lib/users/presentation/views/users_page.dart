import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_clean/injection_container.dart';
import 'package:proyect_clean/users/presentation/cubit/users_cubit.dart';
import 'package:proyect_clean/users/presentation/views/widgets/search_user_widget.dart';
import 'package:proyect_clean/core/widgets/error_message.dart';
import 'package:proyect_clean/core/widgets/loading_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/widgets/card_empty_widget.dart';

class UsersPage extends StatelessWidget {
  UsersPage({super.key});
  final users = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var userSearch;

    return Scaffold(
      backgroundColor: Colors.grey.shade100.withAlpha(255),
      appBar: AppBar(
        title: Text("Prueba de ingreso"),
        backgroundColor: Colors.green.shade900,
      ),
      body: BlocProvider(
        create: (_) => sl<UsersCubit>(),
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            return _buildContentFromState(context, state, size);
          },
        ),
      ),
    );
  }

  Widget _buildContentFromState(
    BuildContext context,
    UsersState state,
    Size size,
  ) {
    if (state is UsersInitial) {
      _getUserList(context);
      return LoadingIndicator();
    } else if (state is UsersLoading) {
      return LoadingIndicator();
    } else if (state is UsersLoaded) {
      final users = state.users;
      return SearchUsersWidget(context: context, state: state, users: users);
    } else if (state is UsersError) {
      return ErrorMessage(
        message: state.message,
        onPressed: () => _getUserList(context),
      );
    } else {
      return ErrorMessage(
        message: "Ocurrio un error",
        onPressed: () => _getUserList(context),
      );
    }
  }

  void _getUserList(BuildContext context) async {
    final bookDetailCubit = context.read<UsersCubit>();
    bookDetailCubit.getNewListUser();
  }

  void _getUserDetail(BuildContext context) async {
    final bookDetailCubit = context.read<UsersCubit>();
    bookDetailCubit.getNewListUser();
  }
}
