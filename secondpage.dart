import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:trivia_app/question_list.dart';
import 'package:trivia_app/thirdpage.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  _secondpageState createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  PageController? _controller=PageController(initialPage: 0);
  bool isPressed=false;
  Color isTrue=Colors.green;
  Color isWrong=Colors.red;
  Color btncolor=Colors.white;
  int score=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller!,
          onPageChanged: (Page){
          setState(() {
            isPressed=false;
          });
          },
          itemCount: questions.length,
      itemBuilder: (context,index)
      {
         return Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height: 50,),
               Center(child: Text("TRIVIA APP",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
               SizedBox(height: 40,),
               Text("Question ${index +1}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
               SizedBox(height: 20,),
               Text(questions[index].question!,style:TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
               SizedBox(height: 30,),
               for(int i=0;i<questions[index].answer!.length;i++)
                 MaterialButton(
                   onPressed: isPressed?(){
                 }:(){
                     setState(() {
                       isPressed=true;
                     });
                     if (questions[index].answer!.entries.toList()[i].value)
                     {
                       score+=10;
                     }
                 },
                   color: isPressed?questions[index].answer!.entries.toList()[i].value?isTrue:
                       isWrong:btncolor,
                 child: Row(
                   children: [
                     Radio(value:questions[index].answer!.keys.toList()[i],
                         groupValue:questions[index].answer,
                       onChanged:(Object? value){
                       setState(() {
                         value=questions[index].answer!.keys.toList()[i];
                       });
        }),
                     Text(questions[index].answer!.keys.toList()[i],

                     ),
                   ],
                 ),),
               SizedBox(height: 30,),
               Padding(
                 padding: const EdgeInsets.only(right:40),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     SizedBox(
                       height: 40,
                       width: 170,
                       child: ElevatedButton(
                         style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xffFCC60E)),),
                         onPressed:isPressed?
                         index +1==questions.length?(){
                           Navigator.push(context, MaterialPageRoute(builder:
                               (context)=>thirdpage(score)));
                         }:(){
                           _controller!.nextPage(duration:
                           Duration(microseconds: 500),
                               curve:Curves.linear);
                           setState(() {
                             isPressed=false;
                           });

                         }:null,
                           child: Row(
                             children: [
                               Text(index+1==questions.length ? "See Result" : "Next",
                                 style: TextStyle(color:  Color(0xff4A448D)),),
                               SizedBox(width: 40,),
                               Icon(Icons.arrow_forward_outlined,color: Colors.black87,)
                             ],
                           ),

                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ) ;
      }
      ),
    );
  }
}
