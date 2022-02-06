import 'package:fchat/controller/navigation.dart';
import 'package:fchat/dto/contact.dart';
import 'package:fchat/model/repo/contact_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contacts = ContactRepo().getContacts();

    return ListView.builder(
      itemCount: contacts.length,
      shrinkWrap: true,
      padding: EdgeInsets.all(15.0),
      itemBuilder: (context, index) {
        return ContactWidget(contact: contacts[index]);
      },
    );
  }
}

class ContactWidget extends StatelessWidget {
  Contact contact;

  ContactWidget({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        primary: Colors.white,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {
        ControllerRegistry().tabController.animateTo(0);
      },
      child: Card(
          elevation: 20,
          color: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(contact.name, style: TextStyle(fontSize: 40)),
                Container(padding: EdgeInsets.all(10), child: Text(contact.keyHash, style: TextStyle(fontSize: 10), textAlign: TextAlign.center,)),
              ],
            ),
          )),
    );
  }
}
