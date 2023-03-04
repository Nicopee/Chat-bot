import 'package:dialogflowchatbot/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intro extends StatefulWidget {
  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  PageController pageController = PageController();
  late Function goToTab;
  int index = 0;

  @override
  void dispose() {
    super.dispose();
    pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: PageView(
      controller: pageController,
      children: [
        Column(
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.4 * height,
                  child: Image.asset('assets/image2.png'),
                ),
                SizedBox(
                  height: 40,
                ),
                Text('Chatbot',
                    style: Theme.of(context).textTheme.headlineMedium
                    // .copyWith(color: primary),
                    ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'A chatbot or chatterbot is a software application used to conduct an online chat conversation via text or text-to-speech',
                    style: TextStyle(fontSize: 16),
                    // .copyWith(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'SKIP',
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      }),
                  SizedBox(
                    width: 50,
                  ),
                  SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: WormEffect(
                          dotHeight: 5,
                          activeDotColor: primary,
                          dotColor: Theme.of(context).dividerColor),
                      onDotClicked: (index) {}),
                  SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: smallestButtonWidth,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        side: BorderSide(
                          color: Colors.black38,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        // color: primary,
                        // textColor: Colors.white,
                      ),
                      onPressed: () {
                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.ease);
                      },
                      child: Text('NEXT'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.4 * height,
                  child: Image.asset('assets/image4.png'),
                ),
                SizedBox(
                  height: 40,
                ),
                Text('First Aid',
                    style: Theme.of(context).textTheme.headlineMedium
                    // .copyWith(color: primary),
                    ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'First aid is the first and immediate assistance given to any person with either a minor or serious illness or injury, with care provided to preserve life, prevent the condition from worsening, or to promote recovery.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: smallestButtonWidth,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        side: BorderSide(
                          color: Colors.black38,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        // color: primary,
                        // textColor: Colors.white,
                      ),
                      onPressed: () {
                        pageController.animateToPage(0,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.ease);
                      },
                      child: Text('BACK'),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: WormEffect(
                          dotHeight: 5,
                          activeDotColor: primary,
                          dotColor: Theme.of(context).dividerColor),
                      onDotClicked: (index) {}),
                  SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: smallestButtonWidth,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        side: BorderSide(
                          color: Colors.black38,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        // color: primary,
                        // textColor: Colors.white,
                      ),
                      onPressed: () {
                        pageController.animateToPage(2,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.ease);
                      },
                      child: Text('NEXT'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.4 * height,
                  child: Image.asset('assets/image3.jpeg'),
                ),
                SizedBox(
                  height: 40,
                ),
                Text('Safety', style: Theme.of(context).textTheme.headline4
                    // .copyWith(color: primary),
                    ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'First aid kits are important in an emergency as they reduce the risk of minor injuries from worsening. First aid training also gives people confidence to assist with an accident or injury to help alleviate or stabilize the situation.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: smallestButtonWidth,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        side: BorderSide(
                          color: Colors.black38,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        // color: primary,
                        // textColor: Colors.white,
                      ),
                      onPressed: () {
                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.ease);
                      },
                      child: Text('BACK'),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: WormEffect(
                          dotHeight: 5,
                          activeDotColor: primary,
                          dotColor: Theme.of(context).dividerColor),
                      onDotClicked: (index) {}),
                  SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: smallestButtonWidth,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        side: BorderSide(
                          color: Colors.black38,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        // color: primary,
                        // textColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      },
                      child: Text('FINISH'),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
