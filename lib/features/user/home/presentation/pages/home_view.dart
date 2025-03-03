import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.push(Routes.sSettings),
              icon: Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Text(S.of(context).SignInWithGoogle),
      ),
    );
  }
}
/**
 * Browse upcoming Events from today to end of the year {sorted by date}
 * Bookmarked, open event details
 * 
 */
