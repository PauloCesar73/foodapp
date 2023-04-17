import 'package:flutter/material.dart';
import 'package:foodsapp/models/pizza_model.dart';
import 'package:foodsapp/pages/detail_page/widgets/container_change_price.dart';
import 'package:foodsapp/pages/detail_page/widgets/container_image_price.dart';
import 'package:foodsapp/pages/detail_page/widgets/my_widget.dart';

class DetailPage extends StatelessWidget {
  final Pizza pizza;
  final int index;

  const DetailPage({super.key, required this.pizza, required this.index});
  @override
  Widget build(BuildContext context) {
    ValueNotifier myWidget = ValueNotifier(MyWidget(
      key: const ValueKey(1),
      price: pizza.prices[0],
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
        valueListenable: myWidget,
        builder: (context, value, child) {
          return ListView(
            children: [

                ContainerImagePrice(
                  image: pizza.image,
                  index: index,
                  myWidget: myWidget.value,
                ),

                 ContainerChangePrice(
                  title: pizza.title,
                  description: pizza.description,
                  myWidget: myWidget,
                  prices: pizza.prices,
                ),

            ],
          );
        },
      ),
    );
  }
}
