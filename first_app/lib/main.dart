import 'package:flutter/material.dart';
import 'contactPage.dart';
import 'meteoPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TP Synthese'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Nouhayla MOUAKKAL"),
              accountEmail: Text("nouhaylamouakkal@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/photo.png"),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_emergency),
              title: const Text('Contact'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.sunny_snowing),
              title: const Text('Meteo'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MeteoPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('ChatBot'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Mask Detection'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.pink[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/myavatar.png'),
            const SizedBox(height: 20),
            const Text('Welcome!',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),
          ),
            const SizedBox(height: 10),
            const Text('Join Us and Enjoy different functionalities in the app !',),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}