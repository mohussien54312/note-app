
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/Models/provider_note_model.dart';
import 'package:note_app/main.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'Component.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> ke = GlobalKey();
  AutovalidateMode v = AutovalidateMode.disabled;
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  bool isloading = false ;
  bool isswitched = true ;


  something(){
    setState(() {
      isloading = false;
    });
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<p>(context);
    return ChangeNotifierProvider(
      create: (context) => Note(),
      child: Scaffold(
        floatingActionButton: Consumer<Note>(
          builder: (context, value, child) => Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: IconButton(
              onPressed: (){
                v=AutovalidateMode.disabled;


                showModalBottomSheet(
                    isScrollControlled: true,
                    showDragHandle: true,

                    constraints: BoxConstraints(

                      maxHeight: 700
                    ),
                    context: context,
                    builder:(context)=> Container(
                      constraints: BoxConstraints(


                      ),
                        padding: EdgeInsets.only(top: 30,right: 20,left: 20,bottom: MediaQuery.of(context).viewInsets.bottom),
                        child:Form(
                          key: ke,
                          child: Column(
                            children: [
                              CustomTextField(hint: 'title',validate: v,controller: title,),
                              Spacer(
                                flex: 1,
                              ),
                              CustomTextField(hint: 'content',max: 5,validate: v,controller: subtitle,),
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


                                        try {
                                                                                      value.addNote(NoteModel(title.text, subtitle.text,DateTime.now().toString()));


                                        } on Exception catch (e) {
                                          setState(() {
                                            isloading = false;
                                          });
                                          print(e);
                                        }
                                        Future.delayed(Duration(
                                          seconds: 3
                                        ),
                                        () => something()
                                          ,);

                                      }
                                      else{
                                        v=AutovalidateMode.always;
                                      }

                                    },
                                    child: value.loading==true ? CircularProgressIndicator(): Text('Add',
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
        ),
        body: Consumer<Note>(
          builder: (context, value, child) => Padding(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Switch(
                        value: isswitched,
                        onChanged: (b){
                          setState(() {
                            isswitched = !isswitched;
                            prov.changetheme();
                          });
                        })
                  ],
                ),
                Expanded(
                  child: FutureBuilder(
                    builder: (context,snapshot){
                      if(snapshot.hasData)
                      return  ListView.separated(
                        reverse: true,
                        padding: EdgeInsets.only(top: 10),
                        itemBuilder:(context,index)=>CustomNote(Title:snapshot.data![index].Title,Subtitle:snapshot.data![index].SubTitle ,Date:snapshot.data![index].Date ,delete: (){
                          value.deleteNote(index);
                        },),
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (BuildContext context, int index) =>SizedBox(height: 15,),

                      );
                      else if (snapshot.data ==null){
                        return
                        Center(
                          child: Text("hiiiii"),
                        );
                      }
                      else{
                        return   Center(
                          child: Text("hi there"),
                        );
                      }
                    },
                    future: value.fetchNotes(),

                  ),
                )




              ],
            ),
          ),

        ),
      ),
    );
  }
}
