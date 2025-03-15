import 'dart:convert';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:eventra/core/constants/extensions.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/admin/cubit/requests/request_cubit.dart';
import 'package:eventra/features/admin/cubit/requests/request_state.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/helper/external_launcher.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/admin/extension/event.dart';
import 'package:eventra/features/admin/data/model/admin_event.dart';

class AdminEventDetailsScreen extends StatelessWidget {
  final AdminEvent event;
  const AdminEventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: BlocListener<AdminEventRequestCubit, AdminEventRequestState>(
        listener: (context, state) {
          if (state is RequestEventApproved) {
            Fluttertoast.showToast(
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              toastLength: Toast.LENGTH_LONG,
              msg: Localization.adminRequestApprovedMsg,
            );
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.3,
              pinned: true,
              iconTheme: IconThemeData(color: Colors.white),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(Localization.adminEventDetailsAppBar),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    event.cover == null
                        ? Image.asset(
                            StringsManager.eventImage,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            event.cover!,
                            fit: BoxFit.cover,
                          ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromARGB(255, 79, 79, 79)
                                .withAlpha(500),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.qr_code_scanner,
                    size: 38,
                  ),
                  onPressed: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AiBarcodeScanner(
                          onDispose: () {},
                          hideGalleryButton: true,
                          controller: MobileScannerController(
                            detectionSpeed: DetectionSpeed.noDuplicates,
                          ),
                          validator: (value) {
                            if (value.barcodes.isEmpty) {
                              return false;
                            }
                            if (!(value.barcodes.first.rawValue
                                    ?.contains('flutter.dev') ??
                                false)) {
                              return false;
                            }
                            return true;
                          },
                          onDetect: (BarcodeCapture capture) {
                            final String? result =
                                capture.barcodes.first.rawValue;
                            if (result != null) {
                              final RequestEvent request =
                                  RequestEvent.fromJson(json.decode(result));
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Center(
                                      child: Text(
                                    request.eventName,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  content: SizedBox(
                                    height: 250.h,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                          radius: 35,
                                          backgroundImage:
                                              request.user.avatar != null
                                                  ? NetworkImage(
                                                      request.user.avatar!)
                                                  : null,
                                          child: request.user.avatar == null
                                              ? Text(request.user.name
                                                  .abbreviate())
                                              : null,
                                        ),
                                        _buildSectionTitle(Localization
                                            .adminEventDetailsDialogPersonalInfo),
                                        _buildInfoTile(
                                            "${Localization.adminEventDetailsDialogName}:",
                                            request.user.name),
                                        _buildInfoTile(
                                            "${Localization.adminEventDetailsDialogEmail}:",
                                            request.user.email),
                                        _buildInfoTile(
                                            "${Localization.adminEventDetailsDialogPhone}:",
                                            request.user.phone),
                                      ],
                                    ),
                                  ),
                                  actions: request.status ==
                                          RequestStatus.approved
                                      ? null
                                      : [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context)
                                                    .pop(false),
                                            child: TextButton(
                                              onPressed: () {
                                                context
                                                    .read<
                                                        AdminEventRequestCubit>()
                                                    .onRequestApproved(request);
                                                Navigator.of(context).pop(true);
                                              },
                                              child: Text(
                                                Localization.approve,
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 14.sp),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      AdminEventRequestCubit>()
                                                  .onRejectRequest(request);
                                              Navigator.of(context).pop(true);
                                            },
                                            child: Text(
                                              Localization.reject,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14.sp),
                                            ),
                                          ),
                                        ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      event.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Card(
                      margin: EdgeInsets.zero,
                      color: Color(0xFFECEEFD),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          color: Color(0xFF5669FD),
                          Icons.calendar_month_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                    title: Text(event.schedule.date.encodeDate()),
                    subtitle: Text(event.encodeLongDateTime()),
                  ),
                  ListTile(
                    onTap: () => ExternalLauncher.launchLocation(
                        location: event.location.url),
                    leading: Card(
                      margin: EdgeInsets.zero,
                      color: Color(0xFFECEEFD),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          color: Color(0xFF5669FD),
                          Icons.location_on,
                          size: 30,
                        ),
                      ),
                    ),
                    title: Text(event.location.name),
                    subtitle: Text(event.location.address),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      Localization.adminEventDetailsAbout,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      event.desc,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Localization.adminEventDetailsAttendees,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        if (event.attendees.isNotEmpty)
                          TextButton(
                              onPressed: () => context.pushNamed(
                                    AdminRoutes.eventAttendees,
                                    extra: event.attendees,
                                  ),
                              child: Text(
                                Localization.adminEventDetailsSeeAll,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ))
                      ],
                    ),
                  ),
                  if (event.attendees.isEmpty)
                    Center(
                        child:
                            Text(Localization.adminEventDetailsAttendeesEmpty))
                ],
              ),
            ),
            if (event.attendees.isNotEmpty)
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (_, inx) => inx == 24
                        ? CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                              radius: 30,
                              child: Text(
                                "+${event.attendees.length - 24}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          )
                        : event.attendees[inx].avatar != null
                            ? CircleAvatar(
                                radius: 32,
                                backgroundColor: Colors.grey.shade300,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: event.attendees[inx].avatar !=
                                                null &&
                                            event.attendees[inx].avatar!
                                                .isNotEmpty
                                        ? Image.network(
                                            event.attendees[inx].avatar!,
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          (loadingProgress
                                                                  .expectedTotalBytes ??
                                                              1)
                                                      : null,
                                                  strokeWidth: 2,
                                                ),
                                              );
                                            },
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Icon(
                                              Icons.person,
                                              size: 40,
                                              color: Colors.grey.shade600,
                                            ),
                                          )
                                        : Icon(
                                            Icons
                                                .person, // Default icon for missing avatar
                                            size: 40,
                                            color: Colors.grey.shade600,
                                          ),
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                radius: 32,
                                backgroundColor: Colors.grey,
                                child: CircleAvatar(
                                  radius: 30,
                                  child: Text(
                                      event.attendees[inx].name.abbreviate()),
                                ),
                              ),
                    childCount: event.attendees.length > 25
                        ? 25
                        : event.attendees.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _buildInfoTile(String label, String value) {
  return ListTile(
    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    leading: Text(
      label,
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
    ),
    title: Text(value, style: TextStyle(fontSize: 14.sp)),
  );
}
