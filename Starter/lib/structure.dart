import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  DevicePreview(
      builder:(context) =>
    MyApp()
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
            leadingWidth: 100,

            title: const Text(
              "",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            flexibleSpace: Center(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV7h-lhs35mw9fzFraSKuRHgCtGY8CSCkM8w&s',

                height: 100, // Set your desired height
                width: 100 ,  // Set your desired width
                fit: BoxFit.cover,
              ),
            ),

            iconTheme: const IconThemeData(
              color: Colors.white, // Set the Drawer icon color to white
            ),
            toolbarHeight: 70,
            toolbarOpacity: 1,
            backgroundColor: Colors.black,
            elevation: 100,
            actions: <Widget>[
              //IconButton
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                tooltip: 'Notifications',
                onPressed: () {},
              ), //IconButton

            ]),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // First row of horizontally scrollable images
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        "https://i0.wp.com/highschool.latimes.com/wp-content/uploads/2018/06/share-1.jpg?fit=1200%2C630&ssl=1",
                        width: 500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        "https://i.redd.it/c6vvgssko2r21.jpg",
                        width: 465,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        "https://rukminim2.flixcart.com/image/850/1000/kzzw5u80/poster/z/t/u/medium-movie-the-amazing-spider-man-spider-man-print-poster-on-original-imagbvnycqfzmfpd.jpeg?q=90&crop=false",
                        width: 420,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/0a9bf821-8d7e-4b20-9eff-0b6464b508bf/d643jtb-6e01918f-0c14-4749-a74b-927ea8248dfa.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzBhOWJmODIxLThkN2UtNGIyMC05ZWZmLTBiNjQ2NGI1MDhiZlwvZDY0M2p0Yi02ZTAxOTE4Zi0wYzE0LTQ3NDktYTc0Yi05MjdlYTgyNDhkZmEuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ohMPXLD4HIG_HDiyaOyVXf-QKO6BchZdccXmbcCm23o",
                        width: 470,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10), // Spacer between rows

              // Second row of horizontally scrollable images
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        "https://static1.thegamerimages.com/wordpress/wp-content/uploads/2023/05/guardians-of-the-galaxy-vol-3.jpg",
                        width: 500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3f0e7a6a-dbe7-4fec-9f67-1ce36d20beda/df3gbvx-92fe9650-cefb-4fbc-a99d-9a8f823c3f32.png/v1/fill/w_1280,h_720,q_80,strp/wallpaper_wanda_maximoff_by_alitaxx_df3gbvx-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzIwIiwicGF0aCI6IlwvZlwvM2YwZTdhNmEtZGJlNy00ZmVjLTlmNjctMWNlMzZkMjBiZWRhXC9kZjNnYnZ4LTkyZmU5NjUwLWNlZmItNGZiYy1hOTlkLTlhOGY4MjNjM2YzMi5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.JozQLRqK-cj6XHP-vTiQMgBVw3ST2IeiJXJPIes9m2A",
                        width: 500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        "https://rukminim2.flixcart.com/image/850/1000/jbfe7ww0-1/poster/g/k/c/medium-ashd-wall-poster-batman-the-dark-knight-bat-signal-original-imaet2nugm94hvyj.jpeg?q=20&crop=false",
                        width: 500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        "https://static1.cbrimages.com/wordpress/wp-content/uploads/2024/04/joker-2-poster-hints.jpg",
                        width: 500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),





        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                accountName: Text("Jea"),
                accountEmail: Text("Jea@mail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage("https://picsum.photos/200"),
                ),
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(' Home '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' Profile '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(' Setting '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(' Logout '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text(' About app '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
