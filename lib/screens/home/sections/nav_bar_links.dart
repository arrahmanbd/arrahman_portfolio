import 'package:arrahman_portfolio/screens/home/sections/section_utils.dart';

import '../../../all_imports.dart';
import 'nav_button.dart';

class TableOfContents extends StatelessWidget {
  final List<Section> sections;
  final void Function(Section) onItemTap;

  const TableOfContents({
    Key? key,
    this.sections = const <Section>[],
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: sections
                .map((e) => SectionLink(section: e, onTap: onItemTap))
                .toList(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: sections.map((e) {
              int index = sections.indexOf(e);
              return ListTile(
                title: Text(
                  e.title,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                leading: Icon(menuIcon[index], size: 25.0, color: Colors.grey),
                onTap: () => onItemTap(e),
              );
            }
                // Container(
                //   margin: const EdgeInsets.all(12),
                //   child: SectionLink(section: e, onTap: onItemTap),
                // ),
                ).toList(),
          );
  }
}
