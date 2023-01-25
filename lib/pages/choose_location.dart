import 'package:flutter/material.dart';
import 'package:world_time/model/world_time_class.dart';

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Choose Location Screen'),
          ElevatedButton.icon(
              onPressed: () async {
                WorldTime worldTime =
                    WorldTime(location: 'India', url: 'Asia/Kolkata');
                await worldTime
                    .getTime()
                    .then((value) => Navigator.pop(context, {
                          'name': worldTime.location,
                          'time': worldTime.time,
                        }));
              },
              icon: const Icon(Icons.present_to_all),
              label: const Text('Location')),
        ],
      ),
    );
  }
}
