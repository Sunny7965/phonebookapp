import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonebookbloc/businessLogic/bloc/phone_book_bloc.dart';
import 'package:phonebookbloc/screens/phoneBook.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => PhoneBookBloc(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneBookDemo(),
    ),
  ));
}
