import 'package:flutter/material.dart';

class RoundCornerIconButton extends StatelessWidget {
  final String buttonText;
  final double width;
  final Function onpressed;
  final String imagePath;

  RoundCornerIconButton({
    required this.buttonText,
    required this.width,
    required this.onpressed,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width,
        height: 45,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            colors: [
              Color(0xFFED0205),
              // Color(0xFFFF8F45),
              Color(0xFFFE8F54),
            ],
          ),
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            // elevation: MaterialStateProperty.all(3),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            onpressed();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(imagePath),
              Text(
                buttonText,
                style: TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
