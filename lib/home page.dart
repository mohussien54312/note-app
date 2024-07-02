
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Component.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> ke = GlobalKey();
  AutovalidateMode v = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.7),
            borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        child: IconButton(
          onPressed: (){
            v=AutovalidateMode.disabled;

           showModalBottomSheet(
               context: context,
               builder:(context)=> Container(
                   padding: EdgeInsets.only(top: 30,right: 20,left: 20,),
                   child:Form(
                     key: ke,
                     child: Column(
                       children: [
                         CustomTextField(hint: 'title',validate: v),
                         Spacer(
                           flex: 1,
                         ),
                         CustomTextField(hint: 'content',max: 5,validate: v,),
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
                                   v=AutovalidateMode.always;
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
               ));

          } ,
          icon: Icon(Icons.add),
          iconSize: 55,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70,left: 30,right: 20,bottom: 30),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notes",
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
                        icon: Icon(Icons.search,size: 30,color: Colors.white,)),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(top: 10),
                  itemBuilder:(context,index)=>CustomNote(),
                   itemCount: 6,
                separatorBuilder: (BuildContext context, int index) =>SizedBox(height: 15,),

              ),
            )




          ],
        ),
      ),
    );
  }
}
