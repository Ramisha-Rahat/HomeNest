import 'package:flutter/material.dart';
import 'package:homenestshop/pages/mainpage.dart';


class MyPaymentPage extends StatefulWidget {
  const MyPaymentPage({super.key});

  @override
  State<MyPaymentPage> createState() => _MyPaymentPageState();
}

class _MyPaymentPageState extends State<MyPaymentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
              children:[
                SizedBox(height: 300,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Thank You For Shopping Here :)', style: TextStyle(fontSize: 30, color: Colors.brown),),
                ),
                SizedBox(height: 100,),
                Container(
                  width: 250,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMainPage()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.home, color: Colors.white,size: 30,),
                          SizedBox(width: 10,),
                          Text('Back To Start',style: TextStyle( color: Colors.white,fontSize: 20),)
                        ],
                      ),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
