import 'package:flutter/material.dart';
import 'package:flutter_training/screens/detail_screen.dart';

class ListViewImages extends StatelessWidget {
  final List image;
  const ListViewImages({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: 700,
      child: ListView.builder(
          itemCount: image.length,
          itemBuilder: ((context, index) {
            return ListTile(
              title: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            image_index: index,
                            image: image,
                          ),
                        ));
                  },
                  child: Image.asset(image[index])),
            );
          })),
    );
  }
}
