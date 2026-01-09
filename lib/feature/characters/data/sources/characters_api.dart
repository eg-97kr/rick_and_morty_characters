import 'package:dio/dio.dart';
import 'package:rick_and_morty_characters/feature/characters/data/models/characters_page_model.dart';

class CharactersApi {
  CharactersApi(this._dio);

  final Dio _dio;

  Future<CharactersPageModel> fetchCharactersPage(int page) async {
    final response = await _dio.get(
      'character',
      queryParameters: {'page': page},
    );

    if (response.statusCode == 200 && response.data != null) {
      return CharactersPageModel.fromJson(response.data!);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Empty response body',
        type: DioExceptionType.badResponse,
      );
    }
  }
}
