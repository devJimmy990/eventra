import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/landing/data/data_source/user_data_source.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserDataSource _userDataSource;

  ProfileCubit(this._userDataSource) : super(ProfileInitial());

  Future<void> fetchUserProfile(String uid) async {
  print('Fetching user profile...');
  emit(ProfileLoading());
  try {
    final userData = await _userDataSource.getUserData(uid);
    print('User profile fetched successfully: ${userData['name']}');
    emit(ProfileLoaded(userData));
  } catch (e) {
    print('Error fetching user profile: $e');
    emit(ProfileError('Failed to fetch user profile: $e'));
  }
}

  Future<void> updateUserProfile(String uid, Map<String, dynamic> updatedData) async {
    emit(ProfileLoading()); 
    try {
      await _userDataSource.updateUserData(uid, updatedData);
      final userData = await _userDataSource.getUserData(uid); 
      emit(ProfileLoaded(userData)); 
    } catch (e) {
      emit(ProfileError('Failed to update user profile: $e')); 
    }
  }
}