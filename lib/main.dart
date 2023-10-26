import 'package:animation_full/invite_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const appTitleText = 'Birthday Invitations ';
  static const defaultPosition = 0.0;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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
  static const birthdayTileTitle = 'Birthday Invitation';
  static const birthdayInvitationTitle =
      'You are cordially invited to \ncelebrate birthday!';
  static const tileWidthPercent = 0.4;
  static const tileHeightPercent = 0.4;
  (bool,bool) hasTexts = (false,false);

  late TextEditingController _fromController;
  late TextEditingController _toController;

  final GlobalKey<FormFieldState> _fromGlobalKey = GlobalKey();
  final GlobalKey<FormFieldState> _toGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _fromController = TextEditingController()
      ..addListener(() {
        setState(() {
    
        });
      });
    _toController = TextEditingController()
      ..addListener(() {
        setState(() {
                
        });
      });
  }

  (bool,bool) _validate(){
      return (_fromGlobalKey.currentState!.validate(),_toGlobalKey.currentState!.validate());
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  String? _fromValidator(String? value){
    if(value != null && value.isNotEmpty){
      return null;
    }
    return 'Empty Field';
  }


  String? _toValidator(String? value){
      if(value != null && value.isNotEmpty){
      return null;
    }
    return 'Empty Field';
  }

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.ebGaramond(
            textStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/heading.png'),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 30,
                            child: Center(
                              child: SizedBox(
                                width: width * 0.2,
                                child: TextFormField(
                                  key: _fromGlobalKey,
                                  validator: _fromValidator,
                                  controller: _fromController,
                                  style: GoogleFonts.ebGaramond(
                                    textStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple),
                                  ),
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'From',
                                    labelStyle: GoogleFonts.ebGaramond(
                                      textStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 40,
                          ),
                          Expanded(
                            flex: 30,
                            child: Center(
                              child: SizedBox(
                                width: width * 0.2,
                                child: TextFormField(
                                  key: _toGlobalKey,
                                  validator: _toValidator,
                                  controller: _toController,
                                  style: GoogleFonts.ebGaramond(
                                    textStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple),
                                  ),
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'To',
                                    labelStyle: GoogleFonts.ebGaramond(
                                      textStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 50,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: height * tileHeightPercent * 1,
                    child: SizedBox(
                      child: InviteTile(
                        width: width * tileWidthPercent,
                        height: height * tileHeightPercent,
                        tileTitle: birthdayTileTitle,
                        invitationTitle: birthdayInvitationTitle,
                        to: _toController.text,
                        from: _fromController.text,
                        validate: _validate,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * tileHeightPercent * 0.7,
                    child: SizedBox(
                      child: InviteTile(
                        width: width * tileWidthPercent,
                        height: height * tileHeightPercent,
                        tileTitle: 'Wedding Invitation',
                        invitationTitle:
                            'You are cordially invited to \ncelebrate wedding',
                        to: _toController.text,
                        from: _fromController.text,
                        validate: _validate,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * tileHeightPercent * 0.4,
                    child: SizedBox(
                      child: InviteTile(
                        width: width * tileWidthPercent,
                        height: height * tileHeightPercent,
                        tileTitle: 'Iftar Invitation',
                        invitationTitle: 'You are cordially invited to \nIftar',
                        to: _toController.text,
                        from: _fromController.text,
                        validate: _validate,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * tileHeightPercent * 0.1,
                    child: SizedBox(
                      child: InviteTile(
                        width: width * tileWidthPercent,
                        height: height * tileHeightPercent,
                        tileTitle: 'Office Invitation',
                        invitationTitle:
                            'You are cordially invited to \nOffice Party',
                        to: _toController.text,
                        from: _fromController.text,
                        validate: _validate,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
