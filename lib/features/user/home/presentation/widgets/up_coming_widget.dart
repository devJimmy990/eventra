import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventra/features/admin/event/model/base_event.dart';
import 'package:eventra/features/user/home/presentation/widgets/event_card.dart';

class UpComingWidget extends StatefulWidget {
  final List<BaseEvent> events;

  const UpComingWidget({super.key, required this.events});

  @override
  State<UpComingWidget> createState() => _UpComingWidgetState();
}

class _UpComingWidgetState extends State<UpComingWidget> {
  bool isList = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            shape: RoundedRectangleBorder(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => setState(() => isList = !isList),
              icon: Icon(isList ? Icons.grid_view : Icons.list),
            ),
          ),
          Expanded(
            child: isList
                ? ListView.builder(
                    itemCount: widget.events.length,
                    itemBuilder: (context, index) =>
                        EventCard(event: widget.events[index]),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: widget.events.length,
                    itemBuilder: (context, index) =>
                        EventCard(event: widget.events[index]),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
