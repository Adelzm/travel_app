import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_app/entities/welcome.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<WelcomePageDetails> pagesDetails = const [
    WelcomePageDetails("Discover", "Discover new exotic location you never seen before.",
        "assets/images/welcome_one.jpeg"),
    WelcomePageDetails("Build", "Build new relationships that last a life time.",
        "assets/images/welcome_two.jpeg"),
    WelcomePageDetails(
        "Reflect",
        "Take a moment for your self and reflect on what's important for you.",
        "assets/images/welcome_three.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: pagesDetails.length,
          itemBuilder: ((context, index) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BackgroundImage(imagePath: pagesDetails[index].imagePath),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pagesDetails[index].title,
                              style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              pagesDetails[index].details,
                              style: textTheme.titleLarge,
                            ),
                            const SizedBox(height: 24),
                            FilledButton.tonal(onPressed: () {}, child: const Text("Next"))
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < pagesDetails.length; i++)
                              Container(
                                margin: const EdgeInsets.only(bottom: 3),
                                height: i == index ? 20 : 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(10)),
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.imagePath,
  });
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.5,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  imagePath,
                ).image,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 0.2],
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
