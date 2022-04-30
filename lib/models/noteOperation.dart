// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notee/models/note.dart';

class NoteOperation extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Note> _notes = [];

  List<Note> get getNotes {
    return _notes;
  }

  void addNewNote(String title, String description) {
    final note = Note(title, description);
    _notes.add(note);
    notifyListeners();
  }

  void deleteNote(Note note) {
    _notes.remove(note);
    notifyListeners();
  }
}
