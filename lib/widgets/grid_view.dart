import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';

class GridViewImages extends StatelessWidget {
  final List image;
  const GridViewImages({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: 700,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: image.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 0,
          crossAxisSpacing: 5,
          childAspectRatio: 4 / 3,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: InkWell(
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Image.asset(image[index]),
                )),
          );
        },
      ),
    );
  }
}
