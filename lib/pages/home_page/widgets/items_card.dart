import 'package:flutter/material.dart';
import 'package:foodsapp/const.dart';
import 'dart:math';
import 'package:foodsapp/models/pizza_model.dart';
import 'package:foodsapp/pages/detail_page/detail_page.dart';


class ItemsCard extends StatefulWidget {
  const ItemsCard({super.key});

  @override
  ItemsCardState createState() => ItemsCardState();
}

class ItemsCardState extends State<ItemsCard> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: PageView.builder(
        controller: _pageController,
        itemCount: listPizza.length,
        itemBuilder: (context, index) => InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              index: index,
              pizza: listPizza[index],
            ),
          ),
        );
      },
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 0.5 / 0.55,
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 0, left: 20, right: 20, top: 50),
              decoration: BoxDecoration(
                color: defaultContainer,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listPizza[index].title,
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 5),
                  Text(listPizza[index].description),
                  const SizedBox(height: 15),
                  Text(
                    listPizza[index].prices[0],
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 0;
              if (_pageController.position.haveDimensions) {
                value = index - _pageController.page!;
                value = (value * 0.5).clamp(-1, 1);
              }
              return Transform.rotate(
                angle: -pi * value,
                child: Hero(
                  tag: '$index',
                  child: listPizza[index].image,
                ),
              );
            },
          ),
        ],
      ),
    ),
      ),
    );
  }
}
