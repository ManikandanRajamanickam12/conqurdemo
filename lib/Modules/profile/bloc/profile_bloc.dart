import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc._internal() : super(ProfileInitialState()) {
    on<ProfileInitialEvent>((event, emit) async {
      emit(ProfileInitialState());
    });
  }

  static final _client = ProfileBloc._internal();
  factory ProfileBloc() {
    return _client;
  }

  static ProfileBloc get instance => _client;
}
