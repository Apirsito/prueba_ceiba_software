import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_clean/users/domain/entities/users.dart';
import 'package:proyect_clean/users/presentation/cubit/users_cubit.dart';
import 'package:proyect_clean/core/widgets/card_empty_widget.dart';
import 'package:proyect_clean/users/presentation/views/widgets/tarjet_user_widget.dart';

class SearchUsersWidget extends StatelessWidget {
  SearchUsersWidget(
      {required this.context,
      required this.state,
      required this.users,
      super.key});
  BuildContext context;
  UsersLoaded state;
  List<Users> users;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            showCursor: false,
            onChanged: (value) {
              filterSearchResults(context, value);
            },
            // controller: editingController,
            decoration: InputDecoration(
              labelText: "Buscar usuario",
              labelStyle: TextStyle(
                color: Colors.green.shade900,
              ),
              border: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green.shade900, width: 2.0)),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.green.shade900, width: 2.0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.green.shade900, width: 2.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: state.users.length > 0
              ? ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TarjetUserWidget(
                      users: users[index],
                      onPressed: () {
                        Navigator.pushNamed(context, 'detail',
                            arguments: users[index]);
                        print(users[index].name);
                      },
                    );
                  })
              : ListView(
                  children: [
                    CardEmptyWidget(),
                  ],
                ),
        ),
      ],
    );
  }

  void filterSearchResults(BuildContext context, String query) {
    final bookDetailCubit = context.read<UsersCubit>();
    bookDetailCubit.searchUsers(query);
  }
}
