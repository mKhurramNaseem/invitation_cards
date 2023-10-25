import 'package:flutter/material.dart';

class AnimatedCard extends AnimatedWidget {
  static const imagePath = 'assets/images/card.png';
  static const btnSelectText = 'Select';
  static const btnCancelText = 'Cancel';
  final Animation<double>? _barWidthAnimation,
      _sheetHeightAnimation,
      _slideTitleAnimation,
      _slideToAnimation,
      _slideFromAnimation,
      _buttonsFadeInAnimation;

  final String title, from, to;

  AnimatedCard({
    super.key,
    required super.listenable,
    this.title = '',
    this.from = '',
    this.to = '',
  })  :
        // Slide Bar Animation
        _barWidthAnimation = Tween<double>(begin: 0, end: 200).animate(
            CurvedAnimation(
                parent: listenable as Animation<double>,
                curve: const Interval(0.0, 0.15))),

        // Open Menu Sheet
        _sheetHeightAnimation = Tween<double>(begin: 0, end: 300).animate(
            CurvedAnimation(
                parent: listenable, curve: const Interval(0.2, 0.3))),

        // Invitation Title Animation
        _slideTitleAnimation = Tween<double>(begin: 200, end: 0).animate(
            CurvedAnimation(
                parent: listenable, curve: const Interval(0.35, 0.5))),

        // Invitation To Animation
        _slideFromAnimation = Tween<double>(begin: 200, end: 0).animate(
            CurvedAnimation(
                parent: listenable, curve: const Interval(0.5, 0.65))),

        // Invitation From Animation
        _slideToAnimation = Tween<double>(begin: 200, end: 0).animate(
            CurvedAnimation(
                parent: listenable, curve: const Interval(0.65, 0.8))),

        // Buttons pop up Animation
        _buttonsFadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
                parent: listenable, curve: const Interval(0.8, 0.95)));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 10,
            width: _barWidthAnimation!.value,
            color: Colors.brown,
          ),
        ),
        Positioned(
          top: 20,
          left: 0,
          child: SizedBox(
            width: 200,
            height: _sheetHeightAnimation!.value,
            child: Column(
              children: [
                Expanded(flex: 20, child: Image.asset('assets/images/top_border.png')),
                Expanded(
                  flex: 80,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: _slideTitleAnimation!.value,
                          child: Text(title)),
                      Positioned(
                          top: 20,
                          left: _slideFromAnimation!.value,
                          child: Text(from)),
                      Positioned(
                        top: 40,
                        left: _slideToAnimation!.value,
                        child: Text(to),
                      ),
                      Positioned(
                        top: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Opacity(
                              opacity: _buttonsFadeInAnimation!.value,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(btnSelectText),
                              ),
                            ),
                            Opacity(
                              opacity: _buttonsFadeInAnimation!.value,
                              child: ElevatedButton(
                                onPressed: () {
                                  (listenable as AnimationController).reverse();
                                },
                                child: const Text(btnCancelText),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 20,child: Image.asset('assets/images/bottom_border.png')),
              ],
            ),
          ),
        )
      ],
    );
  }
}
