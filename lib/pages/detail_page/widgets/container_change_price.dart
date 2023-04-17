import 'package:flutter/material.dart';
import 'package:foodsapp/const.dart';
import 'package:foodsapp/pages/detail_page/widgets/my_widget.dart';
class ContainerChangePrice extends StatefulWidget {
  final String title, description;
  final ValueNotifier myWidget;
  final List<String> prices;

  const ContainerChangePrice(
      {super.key, required this.title, required this.description, required this.prices, required this.myWidget});
  @override
  ContainerChangePriceState createState() => ContainerChangePriceState();
}

class ContainerChangePriceState extends State<ContainerChangePrice> {
  int itemSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 10),
        Text(
          widget.description,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 90,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    itemSelected = index;
                    widget.myWidget.value = (index == 0)
                        ? MyWidget(
                            price: widget.prices[0],
                            key: const ValueKey(1),
                          )
                        : (index == 1)
                            ? MyWidget(
                                price: widget.prices[1],
                                key: const ValueKey(2),
                              )
                            : MyWidget(
                                price: widget.prices[2],
                                key: const ValueKey(3),
                              );
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(15),
                  width: 90,
                  decoration: (itemSelected == index)
                      ? BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30))
                      : BoxDecoration(
                          color: defaultContainer,
                          borderRadius: BorderRadius.circular(30),
                        ),
                  child: (index == 0)
                      ? const Text('S', style: TextStyle(fontSize: 25))
                      : (index == 1)
                          ? const Text('M', style: TextStyle(fontSize: 25))
                          : const Text('L', style: TextStyle(fontSize: 25)),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {},
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                width: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: const Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
