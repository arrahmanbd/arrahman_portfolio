
import '../all_imports.dart';

class ToolTechWidget extends StatelessWidget {
  final String techName;

  const ToolTechWidget({Key? key, required this.techName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.play_arrow,
          color: Theme.of(context).primaryColor,
          size: 24,
        ),
        Text(
          " $techName ",
        )
      ],
    );
  }
}