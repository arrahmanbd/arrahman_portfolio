import 'package:arrahman_portfolio/shared/shared_preferences.dart';
import 'package:flutter/scheduler.dart';
import 'package:arrahman_portfolio/all_imports.dart';

class BannerPopup extends StatefulWidget {
  const BannerPopup({Key? key}) : super(key: key);

  @override
  State<BannerPopup> createState() => _BannerPopupState();
}

class _BannerPopupState extends State<BannerPopup> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var seen = LocalStorage.getBool('isAlreadySeen');
      if (seen == null) {
        bannerPopUp();
      } else {
        await Future.delayed(const Duration(hours: 4))
            .then((value) => bannerPopUp());
        await LocalStorage.remove('isAlreadySeen');
      }
    });
  }

  bannerPopUp() {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: false,
      builder: (context) {
        return const AlertDialog(
          iconPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: AppBanners(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return bannerPopUp();
  }
}
