import 'package:escape_fatec/info.page.dart';
import 'package:escape_fatec/scenes/computer.page.dart';
import 'package:escape_fatec/scenes/livro.page.dart';
import 'package:escape_fatec/scenes/password.page.dart';
import 'package:escape_fatec/scenes/website.page.dart';
import 'package:flutter/material.dart';
import 'scenes/roomone.page.dart';
import 'scenes/start.page.dart';
import 'config.page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: false),
      routes: {
        "/start": (context) => const StartPage(),
        "/room1": (context) => const RoomonePage(),
        "/config": (context) => const ConfigPage(),
        "/computer": (context) => const ComputerPage(),
        "/password": (context) => PasswordPage(),
        "/webpage": (context) => const WebpagePage(),
        "/info": (context) => const InfoPage(),
        "/livro": (context) => const TextPage()
      },
      initialRoute: '/start',
    );
  }
}
