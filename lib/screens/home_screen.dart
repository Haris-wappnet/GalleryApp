import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/grid_view.dart';
import 'package:flutter_training/widgets/list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List image = [
      'assets/images/image1.jpg',
      'assets/images/image2.jpg',
      'assets/images/image3.jpg',
      'assets/images/image4.jpg',
      'assets/images/image5.jpg',
      'assets/images/image6.jpg',
      'assets/images/image7.jpg',
      'assets/images/image8.jpg',
      'assets/images/image9.jpg',
      'assets/images/image10.jpg'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallary'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isGrid = true;
                    });
                  },
                  child: const Icon(
                    Icons.grid_view,
                    size: 35,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isGrid = false;
                    });
                  },
                  child: const Icon(
                    Icons.view_list,
                    size: 35,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            Container(
              child: isGrid
                  ? GridViewImages(image: image)
                  : ListViewImages(image: image),
            )
          ],
        ),
      ),
    );
  }
}
