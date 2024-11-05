import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

///
/// This is your coding challenge widget.
///
/// You can create additional files as needed.
///
///
class StartWidget extends StatelessWidget {
  const StartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE8EA81), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF79955D),
                  Color(0xFFAAAB61),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFA7CD81),
                      Color(0xFFE8EA81),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 22,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset('star.svg'),
                        ),
                      ),
                      SizedBox(
                        width: 24,
                        height: 22,
                        child: Center(
                          child: SvgPicture.asset('paw.svg'),
                        ),
                      ),
                      SizedBox(
                        width: 24,
                        height: 22,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset('heart.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}