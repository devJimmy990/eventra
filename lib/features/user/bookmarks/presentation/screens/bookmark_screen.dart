import 'package:eventra/core/helper/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/user/bookmarks/cubit/bookmark_cubit.dart';
import 'package:eventra/features/user/bookmarks/cubit/bookmark_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home/presentation/widgets/event_card.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BookmarkCubit>().getBookmarkedEvents();
  }

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
              return Text(strings.userBookmarkEmpty);
            } else if (state is BookmarkError) {
              return Text("error: ${state.error}");
            } else if (state is BookmarkLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: state.events.length,
                itemBuilder: (context, index) {
                  final event = state.events[index];
                  return Dismissible(
                    key: Key(event.id!),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20.w),
                      child:
                          Icon(Icons.delete, color: Colors.white, size: 30.sp),
                    ),
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Center(
                              child: Text(
                            strings.dialogConfirmDelete,
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          )),
                          content: Text(
                            strings.userBookmarkDeletingMsg,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text(
                                strings.dialogCancel,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 14.sp),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: Text(
                                strings.dialogDelete,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    onDismissed: (direction) {
                      context.read<BookmarkCubit>().removeBookmarkEvent(event);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(strings.userBookmarkDeleted),
                          action: SnackBarAction(
                            label: strings.snackBarUndo,
                            onPressed: () {
                              context
                                  .read<BookmarkCubit>()
                                  .addBookmarkEvent(event);
                            },
                          ),
                        ),
                      );
                    },
                    child: EventCard(event: event, isBookmarkScreen: true),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
