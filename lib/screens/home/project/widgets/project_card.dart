// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arrahman_portfolio/all_imports.dart';
import 'package:arrahman_portfolio/screens/home/gitrepo/files.dart';

class ProjectCard extends StatelessWidget {
  final Function() onTap;
  final String name;
  final String description;
  final String link;
  final bool? top;
  final String time;
  const ProjectCard({
    Key? key,
    required this.onTap,
    required this.name,
    required this.description,
    required this.link,
    this.top,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2, bottom: 2),
      child: Stack(
        children: [
          SizedBox(
            width: 500,
            child: Card(
              color: kWhite,
              margin: EdgeInsets.zero,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    EdgeInsets.all(Responsive.isDesktop(context) ? 25.0 : 15),
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBuilder(
                        text: name,
                        color: kBlack,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 30.0),
                      TextBuilder(
                        text: description,
                        color: kBlack,
                        height: 1.5,
                        maxLines: 5,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 30.0),
                      TextBuilder(
                        text: time,
                        color: kBlack,
                        height: 1.5,
                        maxLines: 5,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 30.0),
                      CustomButton(
                        title: 'More',
                        width: 120,
                        height: 38,
                        icon: FontAwesomeIcons.link,
                        onTap: onTap,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 5,
            top: 10,
            child: top == true
                ? const SizedBox(
                    width: 72,
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.star,
                          size: 18,
                          color: Colors.orange,
                        ),
                        FaIcon(
                          FontAwesomeIcons.star,
                          size: 18,
                          color: Colors.orange,
                        ),
                        FaIcon(
                          FontAwesomeIcons.starHalfStroke,
                          size: 18,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            // Container(
            //   height: 50,
            //   width: 50,
            //   decoration: BoxDecoration(color: top == true ? kBlack : Colors.transparent, shape: BoxShape.circle),
            //   child: Center(
            //     child: TextBuilder(
            //       text: top == true ? 'Top' : '',
            //       color: kWhite,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
