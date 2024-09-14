import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Untitled design.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text(
                  'HOMENEST',
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontSize: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    'Homenest offers a safe haven where comfort meets elegance. Each furniture piece is carefully crafted to create a welcoming atmosphere, turning any house into a true home. Let Homenest be the cornerstone of your perfect living space, where every corner reflects your style and serenity.',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Icon(Icons.call, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('Call Now',style: TextStyle( color: Colors.white,),)
                    ],
                  ),
                ),
              ),
              // Container(
              // width: 150,
              // height: 70,
              // padding: EdgeInsets.all(10),
              // child: ElevatedButton(
              // onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMainPage()));
              // },
              // style: ElevatedButton.styleFrom(
              // backgroundColor: Colors.brown, // Background color
              // shape: RoundedRectangleBorder(
              // borderRadius: BorderRadius.circular(10),
              // // Adjust corner radius as needed
              // ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

// children: [
// Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image:AssetImage('assets/images/Untitled design.png'),
// fit: BoxFit.cover),
// ),
// ),
