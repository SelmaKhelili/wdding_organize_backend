import 'package:flutter/material.dart';

class FullImageScreen extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullImageScreen(
      {super.key, required this.images, required this.initialIndex});

  @override
  State<FullImageScreen> createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Viewer'),
        backgroundColor: Colors.orange,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return Center(
            child: Image.network(widget.images[index]),
          );
        },
      ),
    );
  }
}
