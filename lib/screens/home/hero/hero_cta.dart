import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:arrahman_portfolio/all_imports.dart';

import '../../../animation/entrance_fader.dart';

class HeroCta extends StatefulWidget {
  const HeroCta({super.key});

  @override
  State<HeroCta> createState() => _HeroCtaState();
}

class _HeroCtaState extends State<HeroCta> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: Responsive.isDesktop(context) ? 450 : null,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 120 : 20),
      // color: kBlackShade,
      child: Responsive.isDesktop(context)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextBuilder(
                            text: "Hello, I'm",
                            color: kBlack,
                            fontSize: 14,
                          ),
                          EntranceFader(
                            offset: const Offset(0, 0),
                            delay: const Duration(seconds: 2),
                            duration: const Duration(milliseconds: 800),
                            child: Image.asset(
                              'images/icons/hi.gif',
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      TextBuilder(
                        text: name,
                        color: kBlack,
                        fontSize: 30,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w900,
                        latterSpacing: 1.5,
                      ),
                      const SizedBox(height: 5.0),
                    
                      EntranceFader(
                        offset: const Offset(-10, 0),
                        delay: const Duration(seconds: 1),
                        duration: const Duration(milliseconds: 800),
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(' Flutter Developer',
                                    speed: const Duration(milliseconds: 50),
                                    textStyle: TextStyle(
                                      color: kBlack,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.5,
                                    )),
                                TyperAnimatedText(' Web Designer',
                                    speed: const Duration(milliseconds: 50),
                                    textStyle: TextStyle(
                                      color: kBlack,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.5,
                                    )),
                                TyperAnimatedText(' Story Writer',
                                    speed: const Duration(milliseconds: 50),
                                    textStyle: TextStyle(
                                      color: kBlack,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.5,
                                    )),
                              ],
                              isRepeatingAnimation: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      CustomButton(
                        title: 'Email',
                        icon: FontAwesomeIcons.envelope,
                        onTap: () {
                          UrlLaunch.makeEmail(
                              body: 'Hello, ',
                              email: emailId,
                              subject: 'Hello, I need Assistant');
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: EntranceFader(
                    offset: const Offset(0, 0),
                    delay: const Duration(seconds: 1),
                    duration: const Duration(milliseconds: 800),
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(20),
                      child: const CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 300,
                        backgroundImage: AssetImage(
                          'images/images/programming.png',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBuilder(
                      text: "Hello, I'm",
                      color: kBlack,
                      fontSize: 14,
                    ),
                    const SizedBox(height: 5.0),
                    TextBuilder(
                      text: name,
                      color: kBlack,
                      fontSize: 30,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w800,
                      latterSpacing: 1.5,
                    ),
                    const SizedBox(height: 5.0),
                    TextBuilder(
                      text: role,
                      color: kBlack,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      latterSpacing: 1.5,
                    ),
                    const SizedBox(height: 20.0),
                    CustomButton(
                      title: 'Email',
                      icon: FontAwesomeIcons.envelope,
                      onTap: () {
                        UrlLaunch.makeEmail(
                            body: 'Hello, ',
                            email: emailId,
                            subject: 'Hello, I need Assistant');
                      },
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 150,
                    backgroundImage: AssetImage(
                      'assets/images/my_pic.jpg',
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
