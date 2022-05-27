part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileInitialEvent extends ProfileEvent {
  final String msg;
  const ProfileInitialEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}
