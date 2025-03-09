import 'package:eventra/features/user/home/data/model/booked_event.dart';
import 'package:eventra/features/user/home/data/data_source/user_bookmark_data_source.dart';

class UserBookmarkRepository {
  final UserBookmarkDataSource _dataSource;

  UserBookmarkRepository(this._dataSource);

  addBookmarkEvent(UserEvent event, String uid) async {
    try {
      Map<String, dynamic> data =
          await _dataSource.addBookmarkEvent(event.toJson(), uid);
      return UserEvent.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  getBookmarkedEvents(String uid) async {
    try {
      List<Map<String, dynamic>> data =
          await _dataSource.getBookmarkedEvents(uid);
      return data.map((e) => UserEvent.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
