import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'Menu.dart';

void main() => runApp(
    DevicePreview(
        builder:(context) =>
            LoginScreen()
    )
);

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],

        ),
        body: Container(
          width: double.infinity,
          color: Colors.yellow[700], // This will apply the color to the entire body
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                       // Individual container color
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              'new-UNSW-logo-png-horizontal-crest.png',
                              width: 250,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                       // Individual container color
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  "MAJOR INCIDENT",
                                  style: TextStyle(
                                    fontSize: 39,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "RESPONSE APPLICATION",
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'xyz@xyz.com.au',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        enabled: false, // Disabled to make it unclickable
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '•••••••••••••',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        enabled: false, // Disabled to make it unclickable
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              // Text color
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MenuScreen()), // Navigate to Menu
                              );
                            },
                            child: Text('LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                    Container(
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),




      ),
    );
  }
}