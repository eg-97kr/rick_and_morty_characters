abstract class CharactersEvent {
  const CharactersEvent();
}

class CharactersStarted extends CharactersEvent {
  const CharactersStarted();
}

class CharactersLoadNextPage extends CharactersEvent {
  const CharactersLoadNextPage();
}

class CharactersRefreshed extends CharactersEvent {
  const CharactersRefreshed();
}
