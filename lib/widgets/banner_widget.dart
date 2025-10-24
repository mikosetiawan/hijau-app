import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hijau/theme.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final PageController _pageController = PageController();
  final List<String> bannerImages = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];

  int currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // ===== Auto slide timer =====
    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (currentIndex < bannerImages.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }

      _pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ===== Background page view (banner scroll) =====
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemCount: bannerImages.length,
            itemBuilder: (context, index) {
              return Image.asset(
                bannerImages[index],
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),

          // ===== Dots indicator =====
          Positioned(
            bottom: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                bannerImages.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == index ? 20 : 5,
                  height: currentIndex == index ? 5 : 5,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? secondaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
