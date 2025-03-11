import 'package:eventra/core/helper/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/user/bookmarks/cubit/bookmark_cubit.dart';
import 'package:eventra/features/user/bookmarks/cubit/bookmark_state.dart';
import 'package:eventra/features/user/bookmarks/presentation/widgets/bookmark_event_card.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = Localization(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.favoriteEvents),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<BookmarkCubit, BookmarkState>(
          builder: (context, state) {
            if (state is BookmarkLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is BookmarkEmpty) {
              return Text(strings.data);
            } else if (state is BookmarkError) {
              return Text("error: ${state.error}");
            } else if (state is BookmarkLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: state.events.length,
                itemBuilder: (context, index) {
                  return BookmarkEventCard(
                    state.events[index],
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
