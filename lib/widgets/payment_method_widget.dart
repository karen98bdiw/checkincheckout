import 'package:flutter/material.dart';
import '../constants/theme.dart';

class PaymnetMethodWidget extends StatelessWidget {
  final String title;
  final String cardNumber;
  final String asset;

  PaymnetMethodWidget({
    @required this.title,
    @required this.cardNumber,
    @required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color.fromRGBO(222, 226, 236, 1), width: 1),
      ),
      padding: EdgeInsets.symmetric(vertical: 22),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/mCard.png",
              height: 36,
              width: 59,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  cardNumber,
                  style: TextStyle(
                    color: Gray3,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.delete,
                color: mainOrange,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
