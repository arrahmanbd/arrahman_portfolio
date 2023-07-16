import '../../../all_imports.dart';
import 'section_utils.dart';

class SectionLink extends StatelessWidget {
  final Section section;
  final void Function(Section) onTap;

  const SectionLink({Key? key, required this.section, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kWhite,
        elevation: 0, // Set the elevation of the button to 0
      ),
      onPressed: () => onTap(section),
      child: Text(section.title.toString()),
    );
  }
}
