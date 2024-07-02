import 'package:flutter/material.dart';

import 'Component.dart';

class EditeNotes extends StatelessWidget {
  const EditeNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 70,left: 30,right: 20,bottom: 30),
          child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // IconButton(onPressed: (){
                      //   Navigator.pop(context);
                      // },
                      //     icon: Icon(Icons.arrow_back_ios)),

                      Text("Edite Note",
                        style: TextStyle(
                          fontSize: 35,
                        ),),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.done,size: 30,color: Colors.white,)),
                      )
                    ],
                  ),
                ),
              CustomTextField(hint: 'title',),
              CustomTextField(hint: 'content',max: 5),
                Text("hello")

              ])),
    );
  }
}
