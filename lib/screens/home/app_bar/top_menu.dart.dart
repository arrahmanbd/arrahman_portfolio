import 'package:arrahman_portfolio/all_imports.dart';

import '../../../themes/views/theme_changer.dart';
import '../sections/nav_bar_links.dart';
import '../sections/section_utils.dart';

class TopMenu extends StatefulWidget {
  @override
  State<TopMenu> createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> {
  final tableOfContents = TableOfContents(
    sections: sections,
    onItemTap: (section) {
      final targetContext = section.key.currentContext;
      if (targetContext != null) {
        Scrollable.ensureVisible(
          targetContext,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    },
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 90,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 120 : 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset('images/icons/logo.png')),
              const SizedBox(width: 10.0),
              TextBuilder(
                text: 'ARs Portfolio',
                fontSize: 26,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w600,
                color: kBlack,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              tableOfContents,
              const SizedBox(width: 10.0),
              const ThemeChanger(),
              const SizedBox(width: 20.0),
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
    );
  }
}
