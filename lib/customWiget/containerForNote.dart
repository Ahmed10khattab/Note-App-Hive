import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivee/screens/EdeteNote.dart';
import 'package:hivee/screens/model/NoteModel.dart';

class ContainerForNote extends StatefulWidget {
  ContainerForNote(
      {Key? key,
      @required this.content,
      @required this.id,
      @required this.title})
      : super(key: key);
  String? content;
  String? title;
  int? id;
  @override
  State<ContainerForNote>createState()=>_ContainerForNoteState();

}

class _ContainerForNoteState extends State<ContainerForNote> {
  @override
  @override
  Widget build(BuildContext context) {
    delete(var string) async {
      await Hive.box<NoteMode>('khattab').delete(string);
      print('delete');
      setState(() {

      });
    }

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      // padding: EdgeInsets.symmetric(horizontal: w * .04, vertical: h * .01),
      margin: EdgeInsets.symmetric(horizontal: w * .05, vertical: h * .025),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(w * .02),
        color: Colors.amber[300],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      widget.title!,
                      style: TextStyle(
                          color: Color.fromARGB(255, 17, 82, 19),
                          fontSize: h * .03),
                    )),
                Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () async {
                          await Hive.box<NoteMode>('khattab').delete(widget.id);
                        setState(() {
                         
                        });
                      },
                      icon: Icon(Icons.delete),
                      iconSize: h * .04,
                      color: Colors.blueGrey,
                    ))
              ],
            ),
            SizedBox(
              height: h * .02,
            ),
            Container(
              height: h*.02,
                width: double.infinity,
                child: Text(
                  widget.content!,
                  style: TextStyle(
                      fontSize: h * .02,
                      color: Color.fromARGB(255, 23, 126, 26)),
                  textAlign: TextAlign.start,
                ))

            
            ,SizedBox(
              height: h * .04,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'edit',
                style: TextStyle(
                    fontSize: w * .044,
                    color: Color.fromARGB(255, 130, 151, 130)),
                textAlign: TextAlign.end,
              ),
            )
            
          ],
        ),
      ),
    );
  }  
}
