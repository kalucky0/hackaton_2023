part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {
  const ProfileState(this.tab);

  final int tab;
}

class ProfileInitial extends ProfileState {
  const ProfileInitial() : super(1);
}

class ProfileTabChanged extends ProfileState {
  const ProfileTabChanged(int tab) : super(tab);
}