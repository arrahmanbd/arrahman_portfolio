import 'package:arrahman_portfolio/all_imports.dart';

class Footer extends StatefulWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 120 : 20, vertical: Responsive.isDesktop(context) ? 50 : 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Copyright - AR Rahman (2023)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          const SizedBox(height: 50, width: 50),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('LinkedinIn Button Clicked');
                  }

                  UrlLaunch.launchInBrowser(url: linkedin);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.linkedinIn,
                  color: Colors.blue,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('Twitter Button Clicked');
                  }

                  UrlLaunch.launchInBrowser(url: twitter);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.lightBlue,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('Email Button Clicked');
                  }
                  UrlLaunch.makeEmail(email: emailId, subject: '', body: '');
                },
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
