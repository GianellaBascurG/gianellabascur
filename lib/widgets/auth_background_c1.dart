import 'package:flutter/material.dart';

class AuthBackgroundC1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size_screen = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size_screen.height * 0.4,
      decoration: blueDecoration(),
      child: Stack(
        children: [
          Positioned(
            child: Bubble(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: Bubble(),
            top: -40,
            left: -30,
          ),
          Positioned(
            child: Bubble(),
            top: -50,
            right: -20,
          ),
          Positioned(
            child: Bubble(),
            bottom: -50,
            left: -20,
          ),
          Positioned(
            child: Bubble(),
            bottom: 120,
            right: 20,
          ),
          Positioned(
            child: Bubble(),
            bottom: 20,
            right: 80,
          ),
        ],
      ),
    );
  }

  BoxDecoration blueDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(0, 102, 204, 1), // Azul
            Color.fromRGBO(173, 216, 230, 1), // Celeste
          ],
        ),
      );
}

class Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.15),
      ),
    );
  }
}
