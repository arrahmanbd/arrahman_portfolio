import 'package:arrahman_portfolio/all_imports.dart';

import '../../../utils/app_dimention.dart';
import '../../../widgets/about_data.dart';
import '../../../widgets/community_button.dart';
import '../../../widgets/tool_tech.dart';
import '../../../widgets/woraround.dart';

class About extends StatefulWidget {
  const About({
    Key? key,
  }) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: Responsive.isDesktop(context) ? 450 : null,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 120 : 20),
      child: Responsive.isDesktop(context)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      'images/images/flutter.svg',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBuilder(
                        text: "About Me",
                        color: kBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                      const SizedBox(height: 10.0),
                      TextBuilder(
                        text: about,
                        color: kBlack,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        fontSize: 14,
                      ),
                      const SizedBox(height: 10.0),
                     
                       Row(
                        children: kTools
                            .map((e) => ToolTechWidget(
                                  techName: e,
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 10.0),
                      //   Divider(
                      //   thickness: 1,
                      //   color: Colors.green[800],
                      // ),
                      Row(
                        children: [
                          OutlinedButton(
                            
                            onPressed: () =>print('open pdf'),
                                // html.window.open(StaticUtils.resume, 'pdf'),
                            child: const Text(
                              "Resume",
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            color: Colors.grey[900]!,
                            width: AppDimensions.normalize(30),
                            height: AppDimensions.normalize(.5),
                          ),
                          ...WorkUtils.logos.asMap().entries.map(
                                (e) => Expanded(
                                  child: CommunityIconBtn(
                                    icon: e.value,
                                    link: WorkUtils.communityLinks[e.key],
                                    height:
                                        WorkUtils.communityLogoHeight[e.key],
                                  ),
                                ),
                              )
                        ],
                      ),
                      // const SizedBox(height: 50.0),
                     
                      // const Row(
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         AboutMeData(
                      //           data: "Name",
                      //           information: "AR Rahman",
                      //         ),
                      //         AboutMeData(
                      //           data: "Age",
                      //           information: "22",
                      //         ),
                      //       ],
                      //     ),
                      //     Spacer(),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         AboutMeData(
                      //           data: "Email",
                      //           information: "arrahman.bd@outlook.com",
                      //         ),
                      //         AboutMeData(
                      //           data: "From",
                      //           information: "Jhenaidah, Bangladesh",
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     CustomButton(
                      //       title: 'Linkedin',
                      //       icon: FontAwesomeIcons.linkedin,
                      //       onTap: () {
                      //         if (kDebugMode) {
                      //           print('Linkedin Button Clicked');
                      //         }

                      //         UrlLaunch.launchInBrowser(url: linkedin);
                      //       },
                      //     ),
                      //     const SizedBox(width: 50.0),
                      //   ],
                      // ),
                    
                    ],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    'images/images/flutter.svg',
                    height: 200,
                    width: 200,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBuilder(
                      text: "About Me",
                      color: kBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                    const SizedBox(height: 10.0),
                    TextBuilder(
                      text: about,
                      color: kBlack,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      fontSize: 14,
                    ),
                    const SizedBox(height: 50.0),
                    Divider(
                      color: Colors.grey[800],
                    ),
                    const Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AboutMeData(
                              data: "Name",
                              information: "AR Rahman",
                            ),
                            AboutMeData(
                              data: "Age",
                              information: "22",
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AboutMeData(
                              data: "Email",
                              information: "arrahman.bd@outlook.com",
                            ),
                            AboutMeData(
                              data: "From",
                              information: "Jhenaidah, Bangladesh",
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          title: 'Linkedin',
                          icon: FontAwesomeIcons.linkedin,
                          onTap: () {
                            if (kDebugMode) {
                              print('Linkedin Button Clicked');
                            }

                            UrlLaunch.launchInBrowser(url: linkedin);
                          },
                        ),
                        const SizedBox(width: 50.0),
                        CustomButton(
                          title: 'Resume',
                          icon: FontAwesomeIcons.download,
                          onTap: () {
                            if (kDebugMode) {
                              print('Resume Button Clicked');
                            }

                            UrlLaunch.launchInBrowser(url: github);
                          },
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
    );
  }
}
