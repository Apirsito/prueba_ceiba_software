import 'package:http/http.dart' as http;
import 'package:proyect_clean/core/errors/exceptions.dart';
import 'package:proyect_clean/users/data/models/users_model.dart';

abstract class UsersRemoteDataSource {
  Future<List<UsersModel>> getListUser();
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final http.Client client;

  UsersRemoteDataSourceImpl(this.client);

  @override
  Future<List<UsersModel>> getListUser() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    final response = await client.get(url).timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      return usersModelFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
