import 'package:flutter/material.dart';

class ShowNote extends StatelessWidget {
  const ShowNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var note = ModalRoute.of(context)!.settings.arguments;
    var h = MediaQuery.of(context).size.height;
        var w = MediaQuery.of(context).size. width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top:h* .1,left: w*.03,right: w*.03),
        child: Column(
           
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w*.03),
 

              ),
             
              child: Padding(
                padding:  EdgeInsets .symmetric(horizontal:w*0.03,vertical: h*.01),
                child: Text(note.toString(),style: TextStyle(fontSize:h*.022 ),textAlign: TextAlign.center,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
