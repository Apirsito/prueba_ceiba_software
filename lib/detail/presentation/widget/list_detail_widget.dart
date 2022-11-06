import 'package:flutter/material.dart';
import 'package:proyect_clean/detail/presentation/cubit/detail_cubit.dart';
import 'package:proyect_clean/core/widgets/card_empty_widget.dart';
import 'package:proyect_clean/detail/presentation/widget/card_detail_widget.dart';

class ListDetailWidget extends StatelessWidget {
  DetailLoaded state;
  String userName;
  ListDetailWidget({required this.state, required this.userName, super.key});

  @override
  Widget build(BuildContext context) {
    return state.detailUser.length > 0
        ? ListView.builder(
            itemCount: state.detailUser.length,
            itemBuilder: (BuildContext context, int index) {
              return CardDetailWidget(
                detailUser: state.detailUser[index],
                userName: userName,
              );
            })
        : ListView(
            children: [
              CardEmptyWidget(),
            ],
          );
  }
}
