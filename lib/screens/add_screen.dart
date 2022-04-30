import 'package:flutter/material.dart';
import 'package:notee/models/noteOperation.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  late String titleText;
  late String descriptionText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('Notee'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              border: InputBorder.none,
              hintText: 'Enter Title',
              hintStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            onChanged: (value) {
              titleText = value;
            },
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                border: InputBorder.none,
                hintText: 'Enter Description',
                hintStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
              onChanged: (value) {
                descriptionText = value;
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Provider.of<NoteOperation>(context, listen: false)
              .addNewNote(titleText, descriptionText);
          Navigator.pop(context);
        },
        child: Icon(
          Icons.save,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
