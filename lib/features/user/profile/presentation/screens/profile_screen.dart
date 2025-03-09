import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
;import 'package:eventra/core/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eventra/features/user/profile/cubit/profile_cubit.dart';
import 'package:eventra/features/user/profile/presentation/widgets/profile_tabs.dart';


class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      context.read<ProfileCubit>().fetchUserProfile(user.uid);
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              final userData = state.userData;
              final name = userData['name'] ?? 'No Name';
              final avatarPath = userData['avatar'] ?? 'assets/images/user.png';
              final phone = userData['phone'] ?? 'No phone number available.';
              final email = userData['email'] ?? 'No email available.';
              final aboutMe = userData['bio'] ?? 'No bio available.';

              return Center(
                child: Column(
                  children: [
                    SizedBox(
                        height:
                            MediaQuery.of(context).size.height * 0.02),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: avatarPath.startsWith('assets/')
                          ? AssetImage(avatarPath) as ImageProvider
                          : FileImage(File(avatarPath)),
                    ),
                    SizedBox(
                        height:
                            MediaQuery.of(context).size.height * 0.02),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                        height:
                            MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              final Map<String, dynamic> args = {
                                'currentName': name,
                                'currentAvatarPath': avatarPath,
                                'currentAboutMe': aboutMe,
                                'currentPhone': phone,
                                'currentEmail': email,
                              };
                            
                              context.pushNamed(
                                UserRoutes.editProfile,
                                extra: args,
                              );
                            },
                            icon: Icon(
                              Icons.edit_sharp,
                              color: Colors.deepPurpleAccent,
                            ),
                            label: Text(
                              'Edit Profile',
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent),
                            ),
                            style: TextButton.styleFrom(
                              side: BorderSide(
                                  color: Colors.deepPurpleAccent),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ProfileTabs(tabController: tabController),
                  ],
                ),
              );
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('No data available.'));
            }
          },
        ));
  }
}
