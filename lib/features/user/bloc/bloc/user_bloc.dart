import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';

import 'package:aquayar/features/user/data/repos/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserRepository repo) : super(UserInitial()) {
    on<UserEventUpdateGenderAndName>(
      (event, emit) async {
        emit(UserStateIsLoading());
        String name = event.name;
        String gender = event.gender;

        final user = await repo.updateUser(
          name: name,
          gender: gender,
        );

        user.fold((l) => emit(UserStateError(error: l)), (r) {
          emit(UserStateNameAndGenderUpdated(user: r));
        });
      },
    );
    on<UserEventUpdateCustomerLocation>(
      (event, emit) async {
        emit(UserStateIsLoading());
        final address = event.address;
        final city = event.city;
        final tankSize = event.tankSize;
        final phone = event.phone;
        final countryCode = event.countryCode;

        final user = await repo.addLocation(
            countryCode: countryCode,
            phone: phone,
            city: city,
            address: address,
            tankSize: tankSize);

        user.fold((l) => emit(UserStateError(error: l)), (r) {
          emit(UserStateLocationUpdated(user: r));
        });
      },
    );

    on<UserEventGetOtp>(
      (event, emit) async {
        emit(UserStateIsLoading());
        final phone = event.phone;

        final user = await repo.requestOtp(
          phone: phone,
        );

        user.fold((l) => emit(UserStateError(error: l)), (r) {
          emit(UserStateOtpRequestSent(user: r));
        });
      },
    );
  }
}
