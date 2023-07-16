import 'package:arrahman_portfolio/all_imports.dart';

class Section {
  final GlobalKey key;
  final String title;
  final Widget body;

  const Section(this.key, this.title, this.body);
}

final sections = [
  Section(GlobalKey(), 'Home', const HeroCta()),
  Section(GlobalKey(), 'About', const About()),
  Section(GlobalKey(), 'Project', const Project()),
  Section(GlobalKey(), 'Skills', const Skills()),
  Section(GlobalKey(), 'More', const Footer()),
];

final  List<IconData> menuIcon = [Icons.home_outlined,Icons.add_card,Icons.image,Icons.share,Icons.email];
