import 'package:animation_full/main.dart';
import 'package:animation_full/second_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedCard extends AnimatedWidget {
  static const imagePath = 'assets/images/card.png';
  static const btnSelectText = 'Select';
  static const btnCancelText = 'Cancel';
  static const topCrownPath = 'assets/images/top_border.png';
  static const bottomCrownPath = 'assets/images/bottom_border.png';
  static const topCrownFlex = 10;
  static const bottomCrownFlex = 10;
  static const centerCardFlex = 80;
  final Animation<double>? _barWidthAnimation,
      _sheetHeightAnimation,
      _slideTitleAnimation,
      _slideToAnimation,
      _slideFromAnimation,
      _buttonsFadeInAnimation;

  final String title, from, to;
  final double width, height;

  AnimatedCard({
    super.key,
    required super.listenable,
    this.title = '',
    this.from = '',
    this.to = '',
    this.width = 200,
    this.height = 300,
  })  :
        // Slide Bar Animation
        _barWidthAnimation = Tween<double>(begin: 0, end: width).animate(
            CurvedAnimation(
                parent: listenable as Animation<double>,
                curve: const Interval(0.0, 0.15))),

        // Open Menu Sheet
        _sheetHeightAnimation = Tween<double>(begin: 0, end: height).animate(
            CurvedAnimation(
                parent: listenable, curve: const Interval(0.2, 0.3))),

        // Invitation Title Animation
        _slideTitleAnimation = Tween<double>(begin: width, end: width * 0.05)
            .animate(CurvedAnimation(
                parent: listenable, curve: const Interval(0.35, 0.5))),

        // Invitation To Animation
        _slideFromAnimation = Tween<double>(begin: width, end: width * 0.2)
            .animate(CurvedAnimation(
                parent: listenable, curve: const Interval(0.5, 0.65))),

        // Invitation From Animation
        _slideToAnimation = Tween<double>(begin: width, end: width * 0.2)
            .animate(CurvedAnimation(
                parent: listenable, curve: const Interval(0.65, 0.8))),

        // Buttons pop up Animation
        _buttonsFadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
                parent: listenable,
                curve: const Interval(0.8, 0.95, curve: Curves.bounceIn)));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: MyApp.defaultPosition,
            left: MyApp.defaultPosition,
            child: Container(
              height: height * 0.05,
              width: _barWidthAnimation!.value,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(40),
                ),
                color: Theme.of(context).colorScheme.inversePrimary,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.05,
            left: MyApp.defaultPosition,
            child: SizedBox(
              width: width,
              height: _sheetHeightAnimation!.value,
              child: Column(
                children: [
                  Expanded(
                    flex: topCrownFlex,
                    child: Image.asset(topCrownPath),
                  ),
                  Expanded(
                    flex: centerCardFlex,
                    child: Card(
                      child: Stack(
                        children: [
                          Positioned(
                            top: height * 0.1,
                            left: _slideTitleAnimation!.value,
                            child: Text(
                              title,
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: GoogleFonts.ptSerif(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: (width + height) / 35,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.3,
                            left: _slideFromAnimation!.value,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'From : ',
                                    style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: (width + height) / 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextSpan(
                                    text: from,
                                    style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: (width + height) / 40,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.4,
                            left: _slideToAnimation!.value,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'To : ',
                                    style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: (width + height) / 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextSpan(
                                    text: to,
                                    style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: (width + height) / 40,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.6,
                            left: MyApp.defaultPosition,
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: width * 0.4,
                                  height: height * 0.1,
                                  child: Opacity(
                                    opacity: _buttonsFadeInAnimation!.value,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        (listenable as AnimationController)
                                            .reset();
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SecondPage(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.purple,
                                        elevation: 20,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        btnSelectText,
                                        style: GoogleFonts.ebGaramond(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: (width + height) / 30),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.4,
                                  height: height * 0.1,
                                  child: Opacity(
                                    opacity: _buttonsFadeInAnimation!.value,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        (listenable as AnimationController)
                                            .reverse();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        elevation: 20,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          side:
                                              BorderSide(color: Colors.purple),
                                        ),
                                      ),
                                      child: Text(
                                        btnCancelText,
                                        style: GoogleFonts.ebGaramond(
                                          textStyle: TextStyle(
                                              color: Colors.purple,
                                              fontSize: (width + height) / 30),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: bottomCrownFlex,
                    child: Image.asset(bottomCrownPath),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
