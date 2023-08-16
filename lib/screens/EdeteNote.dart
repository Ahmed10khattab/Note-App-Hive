import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hivee/screens/model/NoteModel.dart';

class EdeteNote extends StatefulWidget {
  EdeteNote({Key? key, this.title, this.content, this.id}) : super(key: key);
  final title;
  final content;
  final id;
  @override
  State<EdeteNote> createState() => _EdeteNoteState();
}

TextEditingController title = TextEditingController();
TextEditingController content = TextEditingController();
// update(List list, var _content, var _title) {
//   for (int i = 0; i <= list.length; i++) {
//     var key = Hive.box<NoteMode>('khattab').getAt(i)!.key;
//     if (i == key) {
//       Hive.box<NoteMode>('khattab')
//           .putAt(i, NoteMode(title: title .text, content: content.text));
//     }
//   }
// }

class _EdeteNoteState extends State<EdeteNote> {
  @override
  void initState() {
    title.text = widget.title;
    content.text = widget.content;

    super.initState();
  }

  @override
  // void dispose() {
  //   title.dispose();
  //   content.dispose();

  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // List l = [id];
    // int n = ModalRoute.of(context)!.settings.arguments as int ;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: h * .04, right: w * .02, left: w * .02),
            child: TextFormField(
              controller: title,
              decoration: InputDecoration(
                hintText: 'title',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(w * .02)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(w * .02)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(w * .02)),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: h * .015, horizontal: w * .02),
            child: TextFormField(
              controller: content,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'content',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(w * .02)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(w * .02)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(w * .02)),
              ),
            ),
          ),
          SizedBox(
            height: h * .07,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * .3),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(w * .02)),
              height: h * .06,
              minWidth: w * .4,
              color: Color.fromARGB(255, 29, 70, 31),
              onPressed: () {
                setState(() {
                  
                });  Hive.box<NoteMode>('khattab')
                    .put(widget.id,
                        NoteMode(title: title.text, content: content.text))
                    .whenComplete(() => {
                      Navigator.pop(context)
                    });
                
              },
              child: Text(
                'save',
                style: TextStyle(fontSize: w * .045),
              ),
            ),
          )
        ],
      ),
    );
  }
}
