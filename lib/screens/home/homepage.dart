import '../../all_imports.dart';
import '../../widgets/floating_button.dart';
import 'sections/section.dart';
import 'sections/section_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedFloatingActionButtonState> key =
        GlobalKey<AnimatedFloatingActionButtonState>();

    ///Creating a list of all sections
    ///
    final sectionList = ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sections.length,
      itemBuilder: (BuildContext context, int index) {
        final section = sections[index];

        return Column(
          children: [
            SectionWidget(
              key: section.key,
              section: section,
            ),
            const CustomDivider(),
          ],
        );
      },
    );

    ///Fav Buttons
    Widget add() {
      return Container(
        child: FloatingActionButton(
          onPressed: () {
            key.currentState?.closeFABs();
          },
          heroTag: "Image",
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
      );
    }

    Widget image() {
      return FloatingActionButton(
        onPressed: () {
          //targetting hero
          final targetContext = sections[0].key.currentContext;
          if (targetContext != null) {
            Scrollable.ensureVisible(
              targetContext,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        },
        heroTag: "Image",
        tooltip: 'Image',
        child: Icon(Icons.arrow_circle_up),
      );
    }

    Widget inbox() {
      return const FloatingActionButton(
        onPressed: null,
        heroTag: "Inbox",
        tooltip: 'Inbox',
        child: Icon(Icons.inbox),
      );
    }

    final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: drawerKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: Responsive.isDesktop(context)
          ? const SizedBox()
          : const MobileDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Responsive.isDesktop(context)
                  ? TopMenu()
                  : MobileHeader(drawerKey: drawerKey),
              sectionList,
              //const BannerPopup()
            ],
          ),
        ),
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        key: key,
        fabButtons: <Widget>[
          add(),
          image(),
          inbox(),
        ],
        colorStartAnimation: Colors.green,
        colorEndAnimation: Colors.black,
        
      ),
    );
  }
}
