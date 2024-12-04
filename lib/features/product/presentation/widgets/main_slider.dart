import 'package:flutter/material.dart';

class MainSlider extends StatefulWidget {
  MainSlider({super.key});

  @override
  State<MainSlider> createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  final List<Map<String, String>> sliderData = [
    {
      'image': 'assets/main_1.png',
      'title': 'Скидка -15%',
      'subtitle': 'Сыворотка HA EYE & NECK SERUM',
      'buttonText': 'Перейти к акции',
    },
    {
      'image': 'assets/main_2.png',
      'title': '5 средств',
      'subtitle': 'для ухода за сухой кожей зимой',
      'buttonText': 'К разделу',
    },
    {
      'image': 'assets/main_3.png',
      'title': 'Мужской уход',
      'subtitle': 'для чувствительной и проблемной кожи',
      'buttonText': 'К разделу',
    }
  ];

  final _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: sliderData.length,
            itemBuilder: (context, index) {
              final data = sliderData[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    data['image']!,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          data['title']!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            data['subtitle']!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                      child: Text(data['buttonText']!),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
             top: 43,
             left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                sliderData.length,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.5),
                  child: Icon(
                    Icons.circle,
                    size: 11,
                    color: _currentIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
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
