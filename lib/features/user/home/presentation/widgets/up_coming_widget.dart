import 'package:eventra/features/admin/event/model/base_event.dart';
import 'package:eventra/features/user/home/presentation/widgets/event_card.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpComingWidget extends StatelessWidget {
  UpComingWidget({super.key, required this.events});
  List<BaseEvent> events;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).upComingEvents,
                style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 4.r,
                      ),
                    ],
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).seeMore,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ))
            ],
          ),
          SizedBox(
            height: 250.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (context, index) => EventCard(
                event: events[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
