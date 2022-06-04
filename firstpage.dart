import 'package:flutter/material.dart';
import 'package:trivia_app/secondpage.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 280,),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Text("TRIVIA APP", style: TextStyle(color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w500),),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: SizedBox(
                    height: 40,
                    width: 160,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) =>secondpage()));
                    },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xffFCC60E)),),
                        child: Row(
                          children: [
                            Text("TAKE TRIVIA",style: TextStyle(color: Color(0xff4A448D)),),
                            SizedBox(width: 20,),
                            Icon(Icons.arrow_forward_outlined,color: Colors.black87,)
                          ],
                        )
                    ),
                  ),
                ),
                SizedBox(height: 290,),

              ],
            ),
          ),
        ),
    );
  }
}
