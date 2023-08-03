import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/responsive.dart';
import '../../../../widgets/show_details.dart';
import '../../../../widgets/text_builder.dart';
import '../auto_state.dart';
import 'project_card.dart';
import 'project_details.dart';

class Project extends ConsumerWidget {
  const Project({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cf = ref.watch(gitViewModel);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isDesktop(context) ? 120 : 20,
        vertical: Responsive.isDesktop(context) ? 50 : 20,
      ),
      child: Column(
        children: [
          TextBuilder(
            text: 'Project',
            color: kBlack,
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
          const SizedBox(height: 30.0),
          cf.when(
              data: (data) => Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      direction: Axis.horizontal,
                      runSpacing: 50,
                      spacing: 50,
                      children: [
                        SizedBox(
                          height: size.height * .75,
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return ProjectCard(
                                onTap: () {},
                                name: data[index].name,
                                description: data[index].description,
                                link: data[index].url,
                                time: data[index].created.substring(0, 10),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, mainAxisSpacing: 20),
                          ),
                        ),
                      ]),
              error: (error, n) => Text(error.toString()),
              loading: () => const Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}
