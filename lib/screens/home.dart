import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivee/customWiget/containerForNote.dart';
import 'package:hivee/main.dart';
import 'package:hivee/screens/EdeteNote.dart';
import 'package:hivee/screens/model/NoteModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

TextEditingController title = TextEditingController();
TextEditingController content = TextEditingController();

class _HomeState extends State<Home> {
  late Box mybox;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  validation() {
    var valid = key.currentState;
    if (valid!.validate()) {
      valid.save();
    }
  }

  @override
  void initState() {
    // Box<NoteMode> mybox = Hive.box<NoteMode>('khattab');
    // print(mybox.get('l')!.content);
    // print('ssssssssssssssssssssss');

    // var res = mybox.get('note1');
    // print(res);
    // print(mybox.get('note1').content);
// mybox= Hive.openBox<NoteMode>('name');
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    content.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    late String keys1;

    late int ID;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(w * .08)),
                  context: context,
                  builder: (context) {
                    return Form(
                      key: key,
                      child: Container(
                        child: ListView(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: h * .015, horizontal: w * .02),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'enter title';
                                  }
                                },
                                controller: title,
                                decoration: InputDecoration(
                                  hintText: 'title',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(w * .02)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(w * .02)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(w * .02)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: h * .015, horizontal: w * .02),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'enter text';
                                  }
                                },
                                controller: content,
                                maxLines: 10,
                                decoration: InputDecoration(
                                  hintText: 'content',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(w * .02)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(w * .02)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(w * .02)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h * .07,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: w * .3),
                              child: MaterialButton(
                                height: h * .05,
                                minWidth: w * .3,
                                color: Color.fromARGB(255, 29, 70, 31),
                                onPressed: () async {
                                  if (key.currentState!.validate()) {
                                    setState(() {
                                      Hive.box<NoteMode>('khattab')
                                          .add(NoteMode(
                                            title: title.text,
                                            content: content.text,
                                          ))
                                          .whenComplete(
                                              () => Navigator.pop(context));
                                    });
                                  }
                                },
                                child: Text(
                                  'add',
                                  style: TextStyle(fontSize: w * .04),
                                ),
                              ),
                            )
                          ],
                        ),

                        //  height: h *.7,
                      ),
                    );
                  });
            },
            child: Icon(Icons.add)),
        appBar: AppBar(
          title: Text('Notes'),
          actions: [
            IconButton(
                onPressed: () {
                  // setState(() {
                  //   Hive.box<NoteMode>('khattab').put(keys1,
                  //       NoteMode(title: 'tixxxxxe', content: 'contennnnt'));
                  // });
                  // print(ID);

                  //  print(mybox.get('l').title);
                  //print(mybox.get('note1').title);
                },
                icon: Icon(Icons.delete))
          ],
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            FutureBuilder(
                future: Hive.openBox<NoteMode>('khattab'),
                builder: ((BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var keys =
                            Hive.box<NoteMode>('khattab').getAt(index)!.key;

                        NoteMode note = Hive.box<NoteMode>('khattab')
                            .getAt(index) as NoteMode;
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'ShowNote',
                                arguments: note.content);
                          },
                          child: Container(
                            // padding: EdgeInsets.symmetric(horizontal: w * .04, vertical: h * .01),
                            margin: EdgeInsets.symmetric(
                                horizontal: w * .05, vertical: h * .025),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w * .02),
                              color: Colors.amber[300],
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * .03),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                            height: h * .04,
                                            child: Text(
                                              note.title!,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 17, 82, 19),
                                                  fontSize: h * .03),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: IconButton(
                                            onPressed: () {
                                              Hive.box<NoteMode>('khattab')
                                                  .delete(keys);

                                              setState(() {});
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
                                      height: h * .045,
                                      width: double.infinity,
                                      child: Text(
                                        note.content!,
                                        style: TextStyle(
                                            fontSize: h * .02,
                                            color: Color.fromARGB(
                                                255, 23, 126, 26)),
                                        textAlign: TextAlign.start,
                                      )),
                                  SizedBox(
                                    height: h * .04,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EdeteNote(
                                                      title: note.title,
                                                      content: note.content,
                                                      id: keys,
                                                    )));
                                      },
                                      child: Text(
                                        'edit',
                                        style: TextStyle(
                                            fontSize: w * .044,
                                            color: Color.fromARGB(
                                                255, 130, 151, 130)),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: Text('no data exist'),
                  );
                }))
          ],
        )

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     TextButton(
        //         onPressed: () {
        //           mybox.put(
        //               'note1', NoteMode(title: 'idea', content: 'good ideia'));
        //         },
        //         child: Text('add name')),
        //     TextButton(
        //         onPressed: () {
        //           print(mybox.get('note1').title);
        //         },
        //         child: Text('get name')),
        //     Container(
        //       color: Colors.amber,
        //       child: Column(
        //         children: [
        //           Center(child: Text(mybox.get('note1').content)),
        //           SizedBox(
        //             height: 20,
        //           ),
        //           Center(child: Text(mybox.get('note1').title)),
        //         ],
        //       ),
        //     )
        //   ],
        // )

        //ListView.builder(
        //   itemCount: 2,
        //   itemBuilder: ((context, index) => ContainerForNote()),
        // )
        );
  }
}
