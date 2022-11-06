import 'package:flutter/material.dart';
import 'package:proyect_clean/detail/domain/entities/detail.dart';

class CardDetailWidget extends StatelessWidget {
  final Detail detailUser;
  final String userName;
  const CardDetailWidget(
      {Key? key, required this.detailUser, required this.userName})
      : super(key: key);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.public,
                    size: 17,
                    color: Colors.green.shade900,
                  ),
                ),
                Text(
                  "id de la publicacion: ${detailUser.id}",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              detailUser.title,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              detailUser.body,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Publicacion realizada por: ${userName}",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.person,
                    size: 17,
                    color: Colors.green.shade900,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
