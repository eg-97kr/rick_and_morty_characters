# Rick and Morty Characters

Flutter-приложение для просмотра персонажей мультсериала **Rick and Morty** с поддержкой избранного, пагинации и оффлайн-режима.

Приложение загружает данные с публичного API, позволяет добавлять персонажей в избранное, сохраняет данные локально и работает без подключения к интернету (в пределах ранее загруженного контента).


## Features

- Список персонажей с пагинацией
- Карточки персонажей (изображение, имя, статус, гендер)
- Добавление / удаление персонажей из избранного
- Экран избранных с сортировкой
- Bottom navigation
- Оффлайн-доступ к ранее загруженным данным
- Кеширование изображений
- Поддержка светлой и тёмной темы с переключением


## Architecture

- State management: **flutter_bloc**
- Dependency injection: **get_it**
- Network: **Dio**
- Local storage: **SharedPreferences**


## Requirements

- Flutter **3.38.5**
- Dart SDK **^3.10.4**


## Installation & Run

1. Клонировать репозиторий:
    ```bash
    git clone https://github.com/eg-97kr/rick_and_morty_characters.git
    cd rick_and_morty_characters

2. Установить зависимости:
    ```bash
    flutter pub get

3. Запустить приложение:
    ```bash
    flutter run


## Dependencies

```yaml
flutter_bloc: ^9.1.1
get_it: ^9.2.0
dio: ^5.9.0
shared_preferences: ^2.5.4
cached_network_image: ^3.4.1
shimmer: ^3.0.0


Data source: https://rickandmortyapi.com/documentation/
