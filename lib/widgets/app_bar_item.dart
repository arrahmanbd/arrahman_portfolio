import 'package:arrahman_portfolio/all_imports.dart';

class TopMenuItem extends StatefulWidget {
  final String? title;
  final Function()? onTap;
  final double? fontSize;
  const TopMenuItem({
    Key? key,
    this.title,
    this.onTap,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  State<TopMenuItem> createState() => _TopMenuItemState();
}

class _TopMenuItemState extends State<TopMenuItem> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kWhite,
        elevation: 0, // Set the elevation of the button to 0
      ),
      onPressed: () => widget.onTap,
      child: Text(widget.title.toString()),
    );
  }
}
