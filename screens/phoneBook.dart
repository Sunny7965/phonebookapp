import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonebookbloc/businessLogic/bloc/phone_book_bloc.dart';

class PhoneBookDemo extends StatefulWidget {
  const PhoneBookDemo({super.key});

  @override
  State<PhoneBookDemo> createState() => _PhoneBookDemoState();
}

class _PhoneBookDemoState extends State<PhoneBookDemo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  showDialogBoxx() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("New Contact"),
            content: SizedBox(
              height: 100,
              // color: Colors.red,
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(hintText: "Enter the Name"),
                  ),
                  TextField(
                    controller: phoneController,
                    decoration:
                        const InputDecoration(hintText: "Enter the Phone"),
                  )
                ],
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              MaterialButton(
                onPressed: () {
                  BlocProvider.of<PhoneBookBloc>(context).add(
                      CreateNewContactEvent(
                          name: nameController.text,
                          phone: phoneController.text));
                  Navigator.pop(context);
                },
                child: const Text("Save Contact"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Phone Book",
          style: GoogleFonts.pacifico(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialogBoxx();
          },
          label: const Text("Add Contact")),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.amber,
        child: BlocBuilder<PhoneBookBloc, PhoneBookState>(
          builder: (context, state) {
            if (state is PhoneBookInitial) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/not found.png',
                        scale: 2,
                      ),
                      Text(
                        "No Contacts Found!",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      )
                    ]),
              );
            } else if (state is ContactAddedState) {
              return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      //backgroundColor: Colors.lime,
                      title: Text(
                        state.list[index]['name']!,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      children: [
                        ListTile(
                          tileColor: Colors.teal,
                          subtitle: Text(state.list[index]['number']!),
                        ),
                      ],
                    );
                  });
            } 
              return  const Center(child: Text("Some Error"));
          },
        ),
      ),
    ));
  }
}
