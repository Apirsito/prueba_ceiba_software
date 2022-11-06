import 'package:flutter/material.dart';

class CardEmptyWidget extends StatelessWidget {
  const CardEmptyWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "List is empty",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
