import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'NoteModel.g.dart';

@HiveType(typeId: 0)
class NoteMode extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? content;

  NoteMode({required this.title, required this.content});
  Map<String, dynamic> toMap() {
    return ({"title": title, "content": content});
  }

  factory NoteMode.fromMap(note) {
    return (NoteMode(title: note['title'], content: note['contnet']));
  }
}

// class StoreNote extends ChangeNotifier {
//   List<NoteMode> notelist = [];
//   storeNote(NoteMode Note) {
//     notelist.add(Note);
//     notifyListeners();
//   }
// }
