import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUser _getUser;

  UserCubit({required GetUser getUser})
      : _getUser = getUser,
        super(UserInitial());

  void fetchUser(int page) async {
    emit(UserLoading());

    final result = await _getUser(Params(page: page));

    result.fold((l) => emit(UserFailed(message: l.message)),
        (r) => emit(UserLoaded(users: r)));
  }
}
