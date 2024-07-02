import 'package:flutter/material.dart';


 class CustomNote extends StatelessWidget {
   const CustomNote({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: (){

         Navigator.pushNamed(context, 'EditePage');

       },
       child: Container(
         padding: EdgeInsets.only(left: 5,bottom: 24),
         decoration: BoxDecoration(
             color: Colors.orangeAccent[100],
             borderRadius: BorderRadius.circular(10)
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             ListTile(
               title: Padding(
                 padding: const EdgeInsets.only(bottom: 12),
                 child: Text("Flutter Tips",
                   style: TextStyle(
                       fontSize: 29,
                       color: Colors.black87,
                       fontWeight: FontWeight.bold
                   ),),
               ),

               subtitle: Padding(
                 padding: const EdgeInsets.only(bottom: 30),
                 child: Text('Build your carrier with mohamed hussien',
                   style: TextStyle(
                       fontSize: 17,
                       color: Colors.black87.withOpacity(0.6)
                   ),),
               ),

               trailing: Icon(Icons.delete,
                 size: 30,
                 color: Colors.black87,),),


             Padding(
               padding: const EdgeInsets.only(right: 14),
               child: Text('March18 , 2001',
                 style: TextStyle(
                     color: Colors.black87
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

    CustomTextField({this.hint,this.max=1,this.validate});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
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

