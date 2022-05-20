import 'package:flutter/material.dart';

import 'page_transitions/horizontal_slide_page.dart';
import 'page_transitions/fade_full_page.dart';
import 'page_transitions/scale_page.dart';
import 'page_transitions/vertical_slide_page.dart';
import 'pages/from_center.dart';
import 'pages/from_down.dart';
import 'pages/from_left.dart';
import 'pages/from_right.dart';
import 'pages/from_up.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'page transition',
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // changePage(BuildContext context, Widget pageName) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => pageName,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VerticalSlidePageTransition(
                      yAxis: -1,
                      useDefaultDuration: false,
                      slideInMilliseconds: 800,
                      pageWidget: const FromUp(pageName: 'Slide from Up'),
                    ),
                  ),
                );
              },
              child: const Text('Up'),
            ),

            //left button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return HorizontalSlidePageTransition(
                        xAxis: -1,
                        useDefaultDuration: false,
                        slideInMilliseconds: 1000,
                        pageWidget: const FromLeft(pageName: 'Slide from Left'),
                      );
                    },
                  ),
                );
              },
              child: const Text('Left'),
            ),

            //center button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const CustomScaleTransition(
                        pageWidget: FromCenter(pageName: 'Scale from Center'),
                      );
                    },
                  ),
                );
              },
              child: const Text('Center'),
            ),

            //fade full page button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const FullPageTransition(
                        //use FromCenter widget here again
                        pageWidget: FromCenter(pageName: 'Fade-in fullPage'),
                      );
                    },
                  ),
                );
              },
              child: const Text('FadePage'),
            ),

            //right button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return HorizontalSlidePageTransition(
                        pageWidget:
                            const FromRight(pageName: 'Slide From Right'),
                        xAxis: 1,
                        slideInMilliseconds: 1000,
                        useDefaultDuration: false,
                      );
                    },
                  ),
                );
              },
              child: const Text('Right'),
            ),

            //down button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VerticalSlidePageTransition(
                      yAxis: 1,
                      useDefaultDuration: false,
                      slideInMilliseconds: 800,
                      pageWidget: const FromDown(pageName: 'Slide from Down'),
                    ),
                  ),
                );
              },
              child: const Text('Down'),
            ),
          ],
        ),
      ),
    );
  }
}
