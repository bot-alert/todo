import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      // title: const Text("Ashish Khatiwada"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
          title: const Text("TO DO LIST",style: TextStyle(color: Colors.black)),
          background: Container(
            color: Colors.green,
          )),
    );
  }
}
