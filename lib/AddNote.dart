import 'package:flutter/material.dart';

import 'Component.dart';



class AddNote extends StatefulWidget {


  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
   GlobalKey<FormState> ke = GlobalKey();

   AutovalidateMode autovalidate = AutovalidateMode.disabled;
 //بيعمل validate مع كل كلمة بتكتبها
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30,right: 20,left: 20,),
      child:Form(
        autovalidateMode: autovalidate,
        key: ke,
        child: Column(
          children: [
            CustomTextField(hint: 'title',),
            Spacer(
              flex: 1,
            ),
            CustomTextField(hint: 'content',max: 5,),
            Spacer(
              flex: 10,
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.orangeAccent[100],
                borderRadius: BorderRadius.circular(20)

              ),
              child: TextButton(
                  onPressed: (){

                    if(ke.currentState!.validate()){

                    }
                    else{
                      setState(() {
                        autovalidate = AutovalidateMode.always;
                      });
                    }

                  },
                  child: Text('Add',
                  style: TextStyle(
                    color: Colors.black87
                  ),)),
            ),
            Spacer(
              flex: 3,
            )

          ],
        ),
      )
    );
  }
}
