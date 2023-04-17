import 'package:flutter/material.dart';
import 'package:foodsapp/const.dart';

class AddressInformation extends StatelessWidget {
  const AddressInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: defaultContainer, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Your Delivery Address'),
                SizedBox(height: 5),
                Text(
                  '241 Hillside Road, HASTINGS',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: ElevatedButton(
              
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              onPressed: () {},
              child: const Icon(Icons.edit),
            ),
          )
        ],
      ),
    );
  }
}
