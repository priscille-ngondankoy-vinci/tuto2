import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'contact_row.dart';


class _HomeScreen extends  StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Contact list"),
      ),

      body: ListView.separated(
        itemCount: defaultContacts.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) =>
            ContactRow(contact: defaultContacts[index]),
      ),



    );
  }


}
