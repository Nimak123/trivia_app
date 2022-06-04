import 'package:flutter/material.dart';
import 'package:trivia_app/question_list.dart';
import 'package:trivia_app/secondpage.dart';

class thirdpage extends StatefulWidget {
  int score;
  thirdpage(this.score,{Key? key}) : super(key: key);

  @override
  _thirdpageState createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Center(child: Text("TRIVIA APP",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
              SizedBox(height: 170,),
              Center(child: Text("Your Score is ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),)),
              SizedBox(height: 20,),
              Center(child: Text("${widget.score}/${questions.length *10}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500),)),
              SizedBox(height: 150,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 40,
                    width: 180,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=>secondpage()));
                    },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xffFCC60E)),),
                        child: Row(
                          children: [
                            Text("RETAKE TRIVIA",style: TextStyle(color: Color(0xff4A448D)),),
                            SizedBox(width: 20,),
                            Icon(Icons.arrow_forward_outlined,color: Colors.black87,)
                          ],
                        )
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
