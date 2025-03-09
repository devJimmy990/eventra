import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/user/home/data/model/booked_event.dart';
import 'package:eventra/features/user/home/cubit/bookmark/bookmark_state.dart';
import 'package:eventra/features/user/home/data/data_source/user_bookmark_data_source.dart';
import 'package:eventra/features/user/home/data/repositories/user_bookmark_repository.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(BookmarkInitial());

  Future<void> addBookmarkEvent(UserEvent event) async {
    emit(BookmarkLoading());
    try {
      String uid = SharedPreference.getString(key: "uid")!;
      await UserBookmarkRepository(UserBookmarkDataSource())
          .addBookmarkEvent(event, uid);
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  Future<void> getBookmarkedEvents() async {
    emit(BookmarkLoading());
    try {
      String uid = SharedPreference.getString(key: "uid")!;
      await UserBookmarkRepository(UserBookmarkDataSource())
          .getBookmarkedEvents(uid);
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }
}
