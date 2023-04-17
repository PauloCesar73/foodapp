import 'package:flutter/material.dart';
import 'package:foodsapp/const.dart';

class ContainerImagePrice extends StatefulWidget {
  final Image image;
  final int index;
  final Widget myWidget;

  const ContainerImagePrice({super.key, required this.image, required this.index, required this.myWidget});
  @override
  ContainerImagePriceState createState() => ContainerImagePriceState();
}

class ContainerImagePriceState extends State<ContainerImagePrice> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            right: -80,
            top: 80,
            child: Container(
              height: 370,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              child: Hero(
                tag: '${widget.index}',
                child: widget.image,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 190,
            child: Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                  child: widget.myWidget,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
