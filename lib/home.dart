import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cur = 0;
  void logout(){
      FirebaseAuth.instance.signOut().then((value) => Navigator.pushNamed(context, 'login'));
      
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/sett.jpg"),fit: BoxFit.cover),
      ),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: cur == 0 ? const Text("Home page") : const Text("Settings"),
          actions: [
            IconButton(onPressed: (){logout();}, icon: const Icon(Icons.logout))
          ],
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: cur == 0
              ? Scaffold(
                body: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Welcome to Home page",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 70),
                        child: const Image(
                          image: AssetImage("assets/home.png"),
                        ),
                      )
                    ],
                  ),
              )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      // Text("settings page"),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              fillColor: Colors.white,
                        filled: true,
                              hintText: "Search for settings",
                               
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))))),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.account_box,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Account",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right),alignment:Alignment.centerRight ,),
                              ],
                            ),
                            const Divider(
                              height: 10,
                              color: Colors.black,
                              thickness: 2,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.notifications,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Notifications",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  width: 68,
                                ),
                              ],
                            ),
                            const Divider(
                              height: 10,
                              color: Colors.black,
                              thickness: 2,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.visibility,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Appearance",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                              ],
                            ),
                            const Divider(
                              height: 10,
                              color: Colors.black,
                              thickness: 2,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.security,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Privacy",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  width: 110,
                                ),
                              ],
                            ),
                            const Divider(
                              height: 10,
                              color: Colors.black,
                              thickness: 2,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.info,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "About",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  width: 130,
                                ),
                              ],
                            ),
                            const Divider(
                              height: 10,
                              color: Colors.black,
                              thickness: 2,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ),

        // floatingActionButton: FloatingActionButton(onPressed: (){},
        // child: cur==0?const Icon(Icons.add):const Icon(Icons.home),
        // ),

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "Settings",
            )
          ],
          currentIndex: cur,
          onTap: (int inde) {
            setState(() {
              cur = inde;
            });
          },
        ),
      ),
    );
  }
}
