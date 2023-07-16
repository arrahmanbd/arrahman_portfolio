import 'package:arrahman_portfolio/all_imports.dart';
import '../screens/home/sections/nav_bar_links.dart';
import '../screens/home/sections/section_utils.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
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
    return Drawer(
      backgroundColor: kWhite,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 190,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'images/images/programming.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 14),
                    child: CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.grey[100],
                      child: const CircleAvatar(
                        radius: 33,
                        backgroundImage:
                            AssetImage('images/images/black-white.png'),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "AR Rahman",
                            style: TextStyle(
                                color: Colors.grey[100],
                                fontWeight: FontWeight.bold),
                          ),
                          Container(height: 5),
                          Text("arrahman.xdr@gmail.com",
                              style: TextStyle(color: Colors.grey[100]))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            tableOfContents,
             
          ],
        ),
      ),
    );
  }
}
