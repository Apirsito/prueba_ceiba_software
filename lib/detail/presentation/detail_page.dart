import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_clean/detail/presentation/cubit/detail_cubit.dart';
import 'package:proyect_clean/detail/presentation/widget/list_detail_widget.dart';
import 'package:proyect_clean/injection_container.dart';
import 'package:proyect_clean/users/domain/entities/users.dart';
import 'package:proyect_clean/users/presentation/cubit/users_cubit.dart';
import 'package:proyect_clean/core/widgets/loading_indicator.dart';

import '../../core/widgets/error_message.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Users arguments =
        (ModalRoute.of(context)?.settings.arguments) as Users;
    print(arguments);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Publicaciones de ${arguments.name}",
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.green.shade900,
      ),
      body: BlocProvider(
        create: (_) => sl<DetailCubit>(),
        child: BlocBuilder<DetailCubit, DetailState>(
          builder: (context, state) {
            return _buildContentFromState(context, state, arguments);
          },
        ),
      ),
    );
  }

  Widget _buildContentFromState(
      BuildContext context, DetailState state, Users user) {
    if (state is DetailInitial) {
      _getUserDetail(context, user.id);
      return LoadingIndicator();
    } else if (state is DetailLoading) {
      return LoadingIndicator();
    } else if (state is DetailLoaded) {
      final detailUser = state.detailUser;
      return ListDetailWidget(
        state: state,
        userName: user.name,
      );
    } else if (state is DetailError) {
      return ErrorMessage(
        message: state.message,
        onPressed: () {},
      );
    } else {
      return Container(
        child: Center(
          child: Text('Error'),
        ),
      );
    }
  }

  void _getUserDetail(BuildContext context, int userId) async {
    final detailCubit = context.read<DetailCubit>();
    detailCubit.getNewDetailUser(userId);
  }
}
