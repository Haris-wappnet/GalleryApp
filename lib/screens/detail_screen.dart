import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  int image_index;
  final List image;
  DetailScreen({super.key, required this.image_index, required this.image});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ScrollController _controller = ScrollController();
  PageController _pagecontroller = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pagecontroller.jumpToPage(widget.image_index);
      MediaQuery.of(context).orientation == Orientation.portrait
          ? _controller.jumpTo(_pagecontroller.offset / 4)
          : _controller.jumpTo(_pagecontroller.offset / 5);

      _pagecontroller.addListener(() {
        if (_pagecontroller.offset != _controller.offset) {
          MediaQuery.of(context).orientation == Orientation.portrait
              ? _controller.jumpTo(_pagecontroller.offset / 4)
              : _controller.jumpTo(_pagecontroller.offset / 5);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallary'),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .12,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                child: PageView.builder(
                  controller: _pagecontroller,
                  itemBuilder: (context, index) {
                    return Image.asset(widget.image[index]);
                  },
                  itemCount: widget.image.length,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      widget.image_index = index;
                      _pagecontroller.animateToPage(widget.image_index,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.linear);
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .18,
                child: ListView.builder(
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 50.0, left: 8.0),
                      decoration: BoxDecoration(
                          border: (widget.image_index == index)
                              ? Border.all(
                                  color: Colors.blue,
                                )
                              : Border.all(color: Colors.white)),
                      child: InkWell(
                        onTap: () {
                          _pagecontroller.jumpToPage(index);
                        },
                        child: Image(
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                            image: AssetImage("${widget.image[index]}")),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  itemCount: widget.image.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: PageView.builder(
                  controller: _pagecontroller,
                  itemBuilder: (context, index) {
                    return Image.asset(widget.image[index]);
                  },
                  itemCount: widget.image.length,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      widget.image_index = index;
                      _pagecontroller.animateToPage(widget.image_index,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.linear);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10.0, left: 8.0),
                      decoration: BoxDecoration(
                          border: (widget.image_index == index)
                              ? Border.all(
                                  color: Colors.blue,
                                )
                              : Border.all(color: Colors.white)),
                      child: InkWell(
                        onTap: () {
                          _pagecontroller.jumpToPage(index);
                        },
                        child: Image(
                            fit: BoxFit.cover,
                            height: 90,
                            width: 90,
                            image: AssetImage("${widget.image[index]}")),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  itemCount: widget.image.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
