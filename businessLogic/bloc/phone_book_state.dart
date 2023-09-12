part of 'phone_book_bloc.dart';

@immutable
abstract class PhoneBookState {}

final class PhoneBookInitial extends PhoneBookState {
  final List<Map<String, String>> list;
  PhoneBookInitial({required this.list});
}

final class ContactAddedState extends PhoneBookState {
  final List<Map<String, String>> list;
  ContactAddedState({required this.list});
}
final class CircularSuccessState extends PhoneBookState{
 
}
final class CircularFailState extends PhoneBookState{

}