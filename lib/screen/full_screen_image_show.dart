import 'package:flutter/material.dart';

class FullScreenImageShow extends StatefulWidget {
  const FullScreenImageShow({super.key});

  @override
  State<FullScreenImageShow> createState() => _FullScreenImageShowState();
}

class _FullScreenImageShowState extends State<FullScreenImageShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned(
            top: 45,
            left: 10,
            child:Image.asset("assets/images/baby.png" , height: 200, width: 200,),),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 450,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Card(
                    color: Colors.greenAccent,
                    shadowColor: Colors.orangeAccent,
                    elevation: 10,
                    child: Column(
                      children: [
                        Image.asset("assets/images/umberally.png" ,),

                        const SizedBox(height: 20,),

                        const Text("Umberally" , style: TextStyle(fontSize: 30 , color: Colors.white),)
                      ],
                    ),),


                ),
              ),


            ],
          ),


          Positioned(
            bottom: 0,
            right: 0,
            child:Image.asset("assets/images/baby_teacher.png" , height: 220, width: 300,fit: BoxFit.cover,),),

        ],

      ),
      
      
    );
  }
}
