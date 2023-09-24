import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFest 2023',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const DevFestHomePage(),
    );
  }
}

class DevFestHomePage extends StatefulWidget {
  const DevFestHomePage({super.key});

  @override
  State<DevFestHomePage> createState() => _DevFestHomePageState();
}

class _DevFestHomePageState extends State<DevFestHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/nuremberg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Colors.black45,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 104),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            width: min(size.width / 2, 540),
                            'images/devfest23_logo_dark.png',
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          launchUrlString(
                            'https://www.google.com/calendar/render?action=TEMPLATE&text=DevFest+2023&dates=20231104T080000Z/20231104T170000Z&details=DevFest+2023+is+a+community+conference+featuring+technical+sessions+from+Google+Developer+Experts+and+local+community+speakers+on+multiple+tracks+covering+Flutter%2C+Android%2C+Firebase%2C+Google+Cloud+Platform%2C+and+more.&location=Solgerstrasse+18,+90429+N%C3%BCrnberg,+Germany&sf=true&output=xml',
                          );
                        },
                        child: const Text(
                          'November 4, 2023',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          launchUrlString(
                            'https://www.google.com/maps/dir/?api=1&destination=Solgerstrasse+18,+90429+N%C3%BCrnberg,+Germany&travelmode=driving',
                          );
                        },
                        child: const Text(
                          'Solgerstrasse 18',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              launchUrlString(
                                'https://sessionize.com/devfest-nuremberg-2023',
                              );
                            },
                            child: const Text('Call for Speakers'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              launchUrlString(
                                'https://gdg.community.dev/events/details/google-gdg-nuremberg-presents-devfest-2023/',
                              );
                            },
                            child: const Text('RSVP'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
