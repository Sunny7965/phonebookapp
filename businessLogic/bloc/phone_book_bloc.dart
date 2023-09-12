
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'phone_book_event.dart';
part 'phone_book_state.dart';

class PhoneBookBloc extends Bloc<PhoneBookEvent, PhoneBookState> {
  PhoneBookBloc() : super(PhoneBookInitial(list: const [])) {
    on<CreateNewContactEvent>((event, emit) {
      Map<String, String> contactMap = {
        "name": event.name,
        "number": event.phone
      };
      emit(ContactAddedState(list: [contactMap]));
    });
  }
  
}
