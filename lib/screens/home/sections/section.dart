import 'package:flutter/material.dart';
import 'section_utils.dart';

class SectionWidget extends StatelessWidget {
  final Section section;
  const SectionWidget({Key? key, required this.section}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: section.body,);
  }
}