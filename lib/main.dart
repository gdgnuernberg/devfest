import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    final widthGreaterThanHeight = size.width > size.height;
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
                          SvgPicture.asset(
                            height: widthGreaterThanHeight ? size.width / 6 : null,
                            width: widthGreaterThanHeight ? null : size.width / 6,
                            'images/devfest23_logo_dark.svg',
                            semanticsLabel: 'DevFest Logo',
                          ),
                        ],
                      ),
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
