import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? location, time;

  @override
  Widget build(BuildContext context) {

    try{
    Map args = ModalRoute.of(context)!.settings.arguments as Map;
      location = args['name'];
      time = args['time'];
      print('$time $location');
    }
    catch(e){
      print('home eror: $e');
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Home Screen'),
          ElevatedButton.icon(
              onPressed: () async {
                dynamic data = await Navigator.pushNamed(context, '/location');
                setState(() {
                  location = data['name'];
                  time = data['time'];
                });
                print('$time $location');
              },
              icon: const Icon(Icons.present_to_all),
              label: const Text('Location')),
        ],
      ),
    );
  }
}
