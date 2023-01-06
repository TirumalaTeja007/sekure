import 'package:flutter/material.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';
import '../../../../../constants/color_constants.dart';
import '../../../../../utils/responsive.dart';
import '../../../../widgets/bottom_bar.dart';

class HomeIndexPage extends StatefulWidget {
  const HomeIndexPage({Key? key}) : super(key: key);

  @override
  State<HomeIndexPage> createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          height: screenSize.height * 0.9,
          width: screenSize.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  image: AssetImage(
                    'assets/images/bus.png',
                  ))),
          padding: EdgeInsets.only(
              left: ResponsiveWidget.isSmallScreen(context)
                  ? 30
                  : ResponsiveWidget.isMediumScreen(context)
                      ? 50
                      : screenSize.width * 0.11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Delivering the",
                    style: TextStyle(
                      fontFamily: 'MontserratExtraBold',
                      color: Colors.white,
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 36 : 48,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "future of mobility",
                    style: TextStyle(
                      fontFamily: 'MontserratExtraBold',
                      color: Colors.green.shade900,
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 36 : 48,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "We believe in customer-centric innovation",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.white,
                        fontSize:
                            ResponsiveWidget.isSmallScreen(context) ? 14 : 18),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15),
                      child: Text(
                        "Talk to an expert",
                        style: TextStyle(
                            fontFamily: 'MontserratRegular',
                            color: Colors.black,
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 14
                                : 18),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 20)
            ],
          ),
        ),
        SizedBox(
            width: screenSize.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      screenSize.width < 800 ? 30 : screenSize.width * 0.11,
                  vertical: screenSize.height / 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "OUR TRUSTED CLIENTELE",
                        style: TextStyle(
                            fontFamily: 'MontserratBold',
                            color: Colors.black54,
                            fontSize: 24),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  screenSize.width < 800
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset("assets/clientele_logos/Logo.png",
                                    width: (screenSize.width - 30) * 0.25,
                                    height: 80),
                                Image.asset("assets/clientele_logos/Logo1.png",
                                    width: (screenSize.width - 30) * 0.25,
                                    height: 80),
                                Image.asset("assets/clientele_logos/Logo2.png",
                                    width: (screenSize.width - 30) * 0.25,
                                    height: 80),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset("assets/clientele_logos/Logo3.png",
                                    width: (screenSize.width - 30) * 0.25,
                                    height: 80),
                                Image.asset("assets/clientele_logos/Logo4.png",
                                    width: (screenSize.width - 30) * 0.25,
                                    height: 80),
                                Image.asset("assets/clientele_logos/Logo5.png",
                                    width: (screenSize.width - 30) * 0.25,
                                    height: 80),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/clientele_logos/Logo.png",
                                width: (screenSize.width * 0.78) * 0.15,
                                height: 100),
                            Image.asset("assets/clientele_logos/Logo1.png",
                                width: (screenSize.width * 0.78) * 0.15,
                                height: 100),
                            Image.asset("assets/clientele_logos/Logo2.png",
                                width: (screenSize.width * 0.78) * 0.15,
                                height: 100),
                            Image.asset("assets/clientele_logos/Logo3.png",
                                width: (screenSize.width * 0.78) * 0.15,
                                height: 100),
                            Image.asset("assets/clientele_logos/Logo4.png",
                                width: (screenSize.width * 0.78) * 0.15,
                                height: 100),
                            Image.asset("assets/clientele_logos/Logo5.png",
                                width: (screenSize.width * 0.78) * 0.15,
                                height: 100),
                          ],
                        ),
                ],
              ),
            )),
        const BottomBar()
      ],
    );
  }
}
