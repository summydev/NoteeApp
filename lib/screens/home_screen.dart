// ignore_for_file: avoid_web_libraries_in_flutter, unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notee/screens/home_screen.dart';
import 'package:notee/screens/add_screen.dart';
import 'package:notee/models/note.dart';
import 'package:notee/models/noteOperation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: Icon(
          Icons.note_add,
          size: 30.0,
          color: Colors.amber,
        ),
      ),
      appBar: AppBar(
        title: Text('Notee'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<NoteOperation>(
        builder: (context, NoteOperation data, child) {
          return ListView.builder(
            itemCount: data.getNotes.length,
            itemBuilder: (context, index) {
              return NotesCard(data.getNotes[index]);
            },
          );
        },
      ),
    );
  }
}

class NotesCard extends StatelessWidget {
  final Note note;

  NotesCard(this.note);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            note.title,
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.0,
          ),
          ExpansionTile(
            expandedAlignment: Alignment.topLeft,
            tilePadding: const EdgeInsets.all(0),
            title: Text(
              note.description + '......',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w100),
            ),
            children: [
              Text(
                note.description,
                style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black,
                    height: 1.4,
                    fontWeight: FontWeight.w100),
              ),
            ],
          ),
          IconButton(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(0),
            color: Colors.red,
            onPressed: () {
              Provider.of<NoteOperation>(context, listen: false)
                  .deleteNote(note);
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
