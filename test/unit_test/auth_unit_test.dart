import 'package:bloc_test/bloc_test.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('AuthenticationCubit', () {
    late AuthenticationCubit cubit;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await SharedPreference.initialize();
      cubit = AuthenticationCubit();
    });

    tearDown(() async {
      await SharedPreference.remove(key: "uid");
      await SharedPreference.remove(key: "fcm-token");
      cubit.close();
    });

    test('initial state is AuthenticationInitial', () {
      expect(cubit.state, isA<AuthenticationInitial>());
    });

    blocTest<AuthenticationCubit, AuthenticationState>(
      'emits Authenticated when UID exists in SharedPreferences',
      build: () {
        SharedPreference.setString(key: 'uid', value: 'test_uid');
        return cubit;
      },
      act: (cubit) => cubit.checkAuthentication(),
      expect: () => [isA<Authenticated>()],
    );

    blocTest<AuthenticationCubit, AuthenticationState>(
      'emits UnAuthenticated when UID does not exist in SharedPreferences',
      build: () => cubit,
      act: (cubit) => cubit.checkAuthentication(),
      expect: () => [isA<UnAuthenticated>()],
    );

    blocTest<AuthenticationCubit, AuthenticationState>(
      'emits AuthenticationError after logout due to missing Firebase setup',
      build: () {
        SharedPreference.setString(key: 'uid', value: 'test_uid');
        SharedPreference.setString(key: 'fcm-token', value: '12345');
        return cubit;
      },
      act: (cubit) {
        cubit.logout();
      },
      expect: () => [isA<AuthenticationError>()],
    );
  });
}
