import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:starter/dashboard.dart';

void main() => runApp(
    DevicePreview(
        builder:(context) =>
            MenuScreen()
    )
);

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text(
            "Menu",
            style: TextStyle(
              color: Colors.white,

            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.amber, // Set the Drawer icon color to white
          ),
          actions: [
            Center(
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,

                ),
              ),
            )
          ],

        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the two boxes
                children: [
                  // First box
                  Container(
                    width: (MediaQuery.of(context).size.width - 60) / 2, // Half of the available width with padding
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.people_outlined, color: Colors.grey, size: 80),
                        SizedBox(height: 10),
                        Text(
                          'Users',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DashboardScreen()), // Navigate to Menu
                          );
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 60) / 2, // Half of the available width with padding
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade600,
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.contact_page_outlined, color: Colors.black, size: 80),
                              SizedBox(height: 10),
                              Text(
                                'Contact lists',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),

                            ],
                          ),
                        ),

                      );
                    }
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the two boxes
                children: [
                  // First box
                  Container(
                    width: (MediaQuery.of(context).size.width - 60) / 2, // Half of the available width with padding
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.groups, color: Colors.grey, size: 80),
                        SizedBox(height: 10),
                        Text(
                          'Group and assiciations',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 60) / 2, // Half of the available width with padding
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.description_outlined, color: Colors.grey, size: 80),
                        SizedBox(height: 10),
                        Text(
                          'Document',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the two boxes
                children: [
                  // First box
                  Container(
                    width: (MediaQuery.of(context).size.width - 60) / 2, // Half of the available width with padding
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.document_scanner, color: Colors.grey, size: 80),
                        SizedBox(height: 10),
                        Text(
                          'Incident types and respond guildlines',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),

        drawer: Drawer(

        ),




      ),
    );
  }
}
