import 'package:flutter/material.dart';
import 'package:homenestshop/pages/loginpage.dart';
import 'package:homenestshop/pages/signup.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mainpageimage.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 200),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HOMENEST',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Step into a world of luxury and sophistication with our designs and make your house a -Home',
                              textAlign: TextAlign.center, // Align text to center
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 300), // Adjust the height to add space between description and buttons
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () => loginPage(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Image.asset('assets/images/icons/user-login.png',
                                height: 40,
                                color: Colors.brown,
                                width: 40,
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text(
                              'Proceed To Login',
                              style: TextStyle(fontSize: 20, color: Colors.brown),
                            ),
                            SizedBox(width: 20,),
                            Icon(Icons.arrow_forward, color: Colors.brown),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15), // Space between the two buttons
                    Container(
                      height: 70,
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Image.asset('assets/images/icons/user-interface.png',
                                   height: 30,
                                  color: Colors.brown,
                                  width: 30,
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text(
                              'New User? Sign Up',
                              style: TextStyle(fontSize: 20, color: Colors.brown),
                            ),
                            SizedBox(width: 20,),
                            Icon(Icons.arrow_forward, color: Colors.brown),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }

  loginPage() {
    Navigator.push(
      context, MaterialPageRoute(builder: (context)=> MyLoginPage()
    ),
    );
  }

}
