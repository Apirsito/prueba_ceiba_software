import 'package:http/http.dart' as http;
import 'package:proyect_clean/core/errors/exceptions.dart';
import 'package:proyect_clean/detail/data/models/detail_model.dart';

abstract class DetailRemoteDataSource {
  Future<List<DetailModel>> getDetailUser(int user);
}

class DetailRemoteDataSourceImpl implements DetailRemoteDataSource {
  final http.Client client;

  DetailRemoteDataSourceImpl(this.client);

  @override
  Future<List<DetailModel>> getDetailUser(int user) async {
    final url =
        Uri.parse("https://jsonplaceholder.typicode.com/posts?userId=$user");
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return detailFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
