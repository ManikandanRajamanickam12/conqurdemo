part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitialState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {
  final String msg;
  ProfileLoadingState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class ProfileErrorState extends ProfileState {
  final String msg;
  ProfileErrorState({required this.msg});
  @override
  List<Object> get props => [msg];
}
