import 'package:flutter/material.dart';
import 'package:proyect_clean/users/domain/entities/users.dart';

class TarjetUserWidget extends StatelessWidget {
  final Users users;

  final VoidCallback onPressed;
  const TarjetUserWidget({
    Key? key,
    required this.users,
    required this.onPressed,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              users.name,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.green.shade900,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    users.phone,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.green.shade900,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    users.email,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 20),
                TextButton(
                    onPressed: onPressed,
                    child: Text(
                      'VER PUBLICACIONES',
                      style: TextStyle(color: Colors.green.shade900),
                    ))
                // ElevatedButton(onPressed: onPressed, child: Text('Reintentar'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
