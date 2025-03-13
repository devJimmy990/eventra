import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/user/event/data/models/booked_event.dart';
import 'package:eventra/features/user/bookmarks/cubit/bookmark_state.dart';
import 'package:eventra/features/user/bookmarks/data/data_source/user_bookmark_data_source.dart';
import 'package:eventra/features/user/bookmarks/data/repositories/user_bookmark_repository.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(BookmarkInitial()) {
    getBookmarkedEvents(); // Loads bookmarked events at startup
  }

  List<UserEvent> _list = [];

  Future<void> addBookmarkEvent(UserEvent event) async {
    try {
      String uid = SharedPreference.getString(key: "uid")!;
      emit(BookmarkLoading());
      final UserEvent data =
      await UserBookmarkRepository(UserBookmarkDataSource())
          .addBookmarkEvent(event, uid);

      _list.add(data);
      emit(BookmarkLoaded(List.from(_list)));
      // Ensure UI updates smoothly
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  Future<void> getBookmarkedEvents() async {
    emit(BookmarkLoading());
    try {
      String uid = SharedPreference.getString(key: "uid")!;
      _list = await UserBookmarkRepository(UserBookmarkDataSource())
          .getBookmarkedEvents(uid);
      emit(_list.isEmpty ? BookmarkEmpty() : BookmarkLoaded(_list));
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  Future<void> removeBookmarkEvent(UserEvent event) async {
    try {
      String uid = SharedPreference.getString(key: "uid")!;
      await UserBookmarkRepository(UserBookmarkDataSource())
          .removeBookmarkEvent(event.id!, uid);

      _list.removeWhere((e) => e.id == event.id);
      emit(BookmarkLoaded(List.from(_list))); // Update without full reload
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }
}