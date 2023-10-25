import 'package:animation_full/invite_tile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const appTitleText = 'Invitations';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: appTitleText),
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
  static const birthdayTileTitle = 'Birthday';
  static const birthdayInvitationTitle =
      'You are invited into birthday party thrown by ....';
  static const tileWidthPercent = 0.4;
  static const tileHeightPercent = 0.4;

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: InviteTile(
                width: width * tileWidthPercent,
                height: height * tileHeightPercent,
                tileTitle: birthdayTileTitle,
                invitationTitle: birthdayInvitationTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
