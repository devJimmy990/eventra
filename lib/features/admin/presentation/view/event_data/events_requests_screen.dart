import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/admin/cubit/requests/request_cubit.dart';
import 'package:eventra/features/admin/cubit/requests/request_state.dart';

class AdminEventsRequestsScreen extends StatelessWidget {
  const AdminEventsRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Localization strings = Localization(context);

    return BlocProvider(
      create: (context) => AdminEventRequestCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<AdminEventRequestCubit, AdminEventRequestState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is EventRequestLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is EventRequestsLoaded) {
              return ListView.builder(
                itemCount: state.requests.length,
                itemBuilder: (_, inx) => Text(strings.data),
              );
            } else if (state is EventRequestEmpty) {
              return Center(child: Text("No Requests"));
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
