import 'package:flutter/material.dart';
import 'package:note_app/Component.dart';


 class CustomNote extends StatelessWidget {
   CustomNote({required this.Title,required this.Subtitle,required this.Date,required this.delete});
   String ?Title;
   String ?Subtitle;
   String ?Date;
   void Function()? delete;
   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: (){

         Navigator.pushNamed(context, 'EditePage');

       },
       child: Container(
         padding: EdgeInsets.only(left: 5,bottom: 24),
         decoration: BoxDecoration(
             color: Theme.of(context).colorScheme.primary,
             borderRadius: BorderRadius.circular(10)
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             ListTile(
               title: Padding(
                 padding: const EdgeInsets.only(bottom: 12),
                 child: Text("$Title",
                   style: TextStyle(
                       fontSize: 29,
                       color: Theme.of(context).colorScheme.secondary,
                       fontWeight: FontWeight.bold
                   ),),
               ),

               subtitle: Padding(
                 padding: const EdgeInsets.only(bottom: 30),
                 child: Text('$Subtitle',
                   style: TextStyle(
                       fontSize: 17,
                       color: Theme.of(context).colorScheme.secondary
                   ),),
               ),

               trailing: InkWell(
                 onTap: delete,
                 child: Icon(Icons.delete,
                   size: 30,
                   color: Theme.of(context).colorScheme.secondary,),
               ),),


             Padding(
               padding: const EdgeInsets.only(right: 14),
               child: Text('$Date',
                 style: TextStyle(
                     color: Theme.of(context).colorScheme.secondary
                 ),),
             )
           ],
         ),


       ),
     );
   }
 }


class  CustomTextField extends StatelessWidget {

   String ?hint ;
   int ? max ;
   AutovalidateMode ? validate;
    TextEditingController ? controller ;

    CustomTextField({this.hint,this.max=1,this.validate,this.controller});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      maxLength: 30,
      autovalidateMode: validate,
      maxLines: max,
      validator: (s){
        if (s!.isEmpty){
          return 'this field can’t be empty';
        }
      },


      decoration: InputDecoration(
        hintText: hint,
        focusedErrorBorder:  OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red,
                width: 3
            )
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red,
                width: 3
            )
        ),
        contentPadding: EdgeInsets.symmetric(horizontal:15,vertical: 15),

        enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black87,
                width: 3
            )
        ),
        focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black87,
                width: 3
            )
        ),
      ),


    );
  }
}

