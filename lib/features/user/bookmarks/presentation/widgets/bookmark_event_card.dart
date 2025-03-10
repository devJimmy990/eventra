import 'package:eventra/features/admin/event/extension/date_time.dart';
import 'package:eventra/features/user/home/data/model/booked_event.dart';
import 'package:flutter/material.dart';

class BookmarkEventCard extends StatefulWidget {
  final UserEvent event;

  const BookmarkEventCard(this.event, {super.key});

  @override
  State<BookmarkEventCard> createState() => _BookmarkEventCardState();
}

class _BookmarkEventCardState extends State<BookmarkEventCard> {
  bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.event.cover ?? "",
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.event.schedule.date.encodeDate(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.red,
                    ),
                    onPressed: () =>
                        setState(() => isBookmarked = !isBookmarked),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              widget.event.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  widget.event.location.name,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
