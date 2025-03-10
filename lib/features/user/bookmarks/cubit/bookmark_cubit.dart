import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/user/home/data/model/booked_event.dart';
import 'package:eventra/features/user/bookmarks/cubit/bookmark_state.dart';
import 'package:eventra/features/user/bookmarks/data/data_source/user_bookmark_data_source.dart';
import 'package:eventra/features/user/bookmarks/data/repositories/user_bookmark_repository.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(BookmarkInitial()) {
    getBookmarkedEvents();
  }

  List<UserEvent> _list = [];
  Future<void> addBookmarkEvent(UserEvent event) async {
    emit(BookmarkLoading());
    try {
      String uid = SharedPreference.getString(key: "uid")!;
      final UserEvent data =
          await UserBookmarkRepository(UserBookmarkDataSource())
              .addBookmarkEvent(event, uid);
      _list.add(data);
      emit(_list.isEmpty ? BookmarkEmpty() : BookmarkLoaded(_list));
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
}
