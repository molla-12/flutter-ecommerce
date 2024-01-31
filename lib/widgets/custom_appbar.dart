import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 1, 1, 1),
      title: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/watchlist');
          },
          icon: const Icon(
            Icons.favorite,
            color: Color.fromARGB(255, 196, 249, 4),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
