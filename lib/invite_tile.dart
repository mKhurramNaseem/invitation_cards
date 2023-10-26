import 'package:animation_full/animated_card.dart';
import 'package:animation_full/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef Validation = (bool,bool) Function();

class InviteTile extends StatefulWidget {
  const InviteTile({
    super.key,
    this.invitationTitle = '',
    this.tileTitle = '',
    this.width = 400,
    this.height = 400,
    this.to = '',
    this.from = '',
    required this.validate,
  });
  final String invitationTitle;
  final double width, height;
  final String to, from, tileTitle;
  final Validation validate;

  @override
  State<InviteTile> createState() => _InviteTileState();
}

class _InviteTileState extends State<InviteTile>
    with SingleTickerProviderStateMixin {
  // Variables to be initialized in initState()
  late AnimationController _animationController;

// All Durations in milliseconds
  static const delay = 50;
  static const barWidthAnimationDuration = 150;
  static const sheetHeightAnimationDuration = 200;
  static const titleSlideDuration = 150;
  static const toTextSlideDuration = 150;
  static const fromTextSlideDuration = 150;
  static const buttonFadeInDuration = 150;
  static const tileWidthPercent = 0.5;
  static const tileHeightPercent = 0.2;

  @override
  void initState() {
    super.initState();

    // Total Duration of the Staggered Animation
    const animationDurationInMilliSeconds = barWidthAnimationDuration +
        sheetHeightAnimationDuration +
        titleSlideDuration +
        toTextSlideDuration +
        fromTextSlideDuration +
        buttonFadeInDuration +
        delay * 3;

    // Initializing Animation Controller
    _animationController = AnimationController(
        vsync: this,
        duration:
            const Duration(milliseconds: animationDurationInMilliSeconds));
  }

  @override
  void dispose() {
    // Disposing Animation Controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Positioned(
            top: MyApp.defaultPosition,
            left: MyApp.defaultPosition,
            width: widget.width * tileWidthPercent,
            height: widget.height * tileHeightPercent,
            child: ListTile(
              style: ListTileStyle.list,
              shape: const StadiumBorder(
                side: BorderSide(
                  color: Colors.purple,
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              splashColor: Theme.of(context).colorScheme.inversePrimary,
              titleTextStyle: GoogleFonts.ebGaramond(
                textStyle: TextStyle(
                  color: Colors.purple,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: (widget.width + widget.height) / 40,
                ),
              ),
              title: Text(
                widget.tileTitle,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.purple,
                size: (widget.width + widget.height) / 35,
              ),
              tileColor: Colors.white,
              titleAlignment: ListTileTitleAlignment.center,
              onTap: _onTileTap,
            ),
          ),
          Positioned(
            top: MyApp.defaultPosition,
            left: widget.width * tileWidthPercent,
            child: AnimatedCard(
              width: widget.width * tileWidthPercent,
              height: widget.height,
              listenable: _animationController,
              title: widget.invitationTitle,
              to: widget.to,
              from: widget.from,
            ),
          ),
        ],
      ),
    );
  }

  void _onTileTap() {
    var (bool fromHasText ,bool toHasText) = widget.validate();
    if (fromHasText && toHasText) {
      _animationController.forward();
    }
  }
}
