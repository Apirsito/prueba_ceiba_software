import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_clean/detail/presentation/detail_page.dart';
import 'package:proyect_clean/users/presentation/views/users_page.dart';

class AppRoutes {
  static const initialRoute = "users";
  static Map<String, Widget Function(BuildContext)> routes = {
    "users": (BuildContext context) => UsersPage(),
    "detail": (BuildContext context) => DetailPage(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => UsersPage());
  }
}
