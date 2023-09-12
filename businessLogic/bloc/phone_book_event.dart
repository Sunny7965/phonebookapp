part of 'phone_book_bloc.dart';

@immutable
abstract class PhoneBookEvent {}

class CreateNewContactEvent extends PhoneBookEvent {
  final String name, phone;
  CreateNewContactEvent({required this.name, required this.phone});
}

class ContactCreateSuccessEvent extends PhoneBookEvent {
  // ignore: prefer_typing_uninitialized_variables
  final CircularProgressIndicator;
  // ignore: non_constant_identifier_names
  ContactCreateSuccessEvent({required this.CircularProgressIndicator});
}

class ContactCreateFailEvent extends PhoneBookEvent {
  final String noSave;
  ContactCreateFailEvent({required this.noSave});
}
