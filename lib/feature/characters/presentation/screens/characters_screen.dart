import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_and_morty_characters/feature/characters/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/bloc/characters_state.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/widgets/character_card.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/widgets/loading_card.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.position.pixels >
        _controller.position.maxScrollExtent - 300) {
      context.read<CharactersBloc>().add(const CharactersLoadNextPage());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          return CustomScrollView(
            controller: _controller,
            slivers: [
              if (state.isInitialLoading)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, _) => const LoadingCard(),
                    childCount: 6,
                  ),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate((_, index) {
                    final item = state.items[index];
                    return CharacterCard(
                      image: item.image,
                      name: item.name,
                      status: item.status,
                      gender: item.gender,
                    );
                  }, childCount: state.items.length),
                ),

              if (state.isPageLoading)
                SliverToBoxAdapter(
                  child: Column(
                    children: const [
                      SizedBox(height: 8),
                      LoadingCard(),
                      LoadingCard(),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
