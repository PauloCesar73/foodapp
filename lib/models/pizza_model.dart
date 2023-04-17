import 'package:flutter/cupertino.dart';

class Pizza {
  final Image image;
  final String title, description;
  final List<String> prices;

  Pizza({required this.image, required this.title, required this.description, required this.prices});
}

List<Pizza> listPizza = [
  Pizza(
    image: Image.asset("img/pizza.png", height: 200),
    title: 'Caesar',
    description: 'Mixed Pizza with cheese',
    prices: ['\$7.9', '\$8.9', '\$10.9'],
  ),
  Pizza(
    image: Image.asset("img/pizza2.png", height: 200),
    title: 'Mexico',
    description: 'Hot pizza with pepper',
    prices: ['\$7.9', '\$8.9', '\$10.9'],
  ),
  Pizza(
    image: Image.asset("img/pizza3.png", height: 200),
    title: 'Margherita',
    description: 'Hot pizza with pepper',
    prices: ['\$7.9', '\$8.9', '\$10.9'],
  ),
];