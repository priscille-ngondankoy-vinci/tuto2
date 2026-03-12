import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'contact_row.dart';


class _HomeScreen extends  StatefulWidget {




  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {

  var showAllContacts = true; // if false only show favorites

  void _toggleMode() => setState(() => showAllContacts = !showAllContacts);
  @override
  @override
  Widget build(BuildContext context) {
    final displayedContacts = [
      for (final contact in defaultContacts)
        if (showAllContacts || contact.isFavorite) contact
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact list"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: Icon(showAllContacts ? Icons.star_border : Icons.star),
            onPressed: _toggleMode,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: 512.0,
            child: ListView.builder(
              itemCount: displayedContacts.length,
              itemBuilder: (context, index) =>
                  ContactRow(contact: displayedContacts[index]),
            ),
          ),
        ),
      ),
    );
  }
}
