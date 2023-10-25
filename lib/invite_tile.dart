import 'package:animation_full/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InviteTile extends StatefulWidget {
  const InviteTile({
    super.key,
    this.invitationTitle = '',
    this.tileTitle = '',
    this.width = 400,
    this.height = 400,
    this.to = '',
    this.from = '',
  });
  final String invitationTitle;
  final double width, height;
  final String to, from, tileTitle;

  @override
  State<InviteTile> createState() => _InviteTileState();
}

class _InviteTileState extends State<InviteTile>
    with SingleTickerProviderStateMixin {
  // Variables to be initialized in initState()
  late AnimationController _animationController;

// All Durations in milliseconds
  static const _delay = 50;
  static const _barWidthAnimationDuration = 150;
  static const _sheetHeightAnimationDuration = 200;
  static const _titleSlideDuration = 150;
  static const _toTextSlideDuration = 150;
  static const _fromTextSlideDuration = 150;
  static const _buttonFadeInDuration = 150;

  @override
  void initState() {
    super.initState();

    // Total Duration of the Staggered Animation
    const animationDurationInMilliSeconds = _barWidthAnimationDuration +
        _sheetHeightAnimationDuration +
        _titleSlideDuration +
        _toTextSlideDuration +
        _fromTextSlideDuration +
        _buttonFadeInDuration +
        _delay * 3;

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
            top: 0,
            left: 0,
            width: widget.width * 0.5,
            height: widget.height * 0.2,
            child: ListTile(
              style: ListTileStyle.list,
              shape: const StadiumBorder(
                side: BorderSide(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              splashColor: Colors.brown,
              titleTextStyle: GoogleFonts.ebGaramond(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                widget.tileTitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              tileColor: Colors.grey,
              onTap: _onTileTap,
            ),
          ),
          Positioned(
            top: 0,
            left: 200,
            width: widget.width * 0.5,
            height: widget.height,
            child: AnimatedCard(
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
    _animationController.forward();
  }
}
