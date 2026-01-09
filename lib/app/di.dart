import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_characters/core/network/dio_client.dart';
import 'package:rick_and_morty_characters/feature/characters/data/repositories/characters_repository_impl.dart';
import 'package:rick_and_morty_characters/feature/characters/data/sources/characters_api.dart';
import 'package:rick_and_morty_characters/feature/characters/data/sources/characters_cache.dart';
import 'package:rick_and_morty_characters/feature/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_characters/feature/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:rick_and_morty_characters/feature/favorites/data/sources/favorites_storage.dart';
import 'package:rick_and_morty_characters/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // Data sources
  getIt.registerLazySingleton<CharactersApi>(
    () => CharactersApi(getIt<DioClient>().dio),
  );

  getIt.registerLazySingleton<CharactersCache>(
    () => CharactersCache(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<FavoritesStorage>(
    () => FavoritesStorage(getIt<SharedPreferences>()),
  );

  // Reposotories
  getIt.registerLazySingleton<CharactersRepository>(
    () => CharactersRepositoryImpl(
      api: getIt<CharactersApi>(),
      cache: getIt<CharactersCache>(),
    ),
  );

  getIt.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(getIt<FavoritesStorage>()),
  );
}
