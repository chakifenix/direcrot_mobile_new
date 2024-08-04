import 'package:direcrot_mobile_new/core/model/nav_model.dart';
import 'package:direcrot_mobile_new/core/common/widgets/bottom_navbar.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/pages/pin_screen.dart';
import 'package:direcrot_mobile_new/features/contingent/presentation/pages/contingent_page.dart';
import 'package:direcrot_mobile_new/features/information/presentation/pages/information_page.dart';
import 'package:direcrot_mobile_new/features/main/presentation/pages/main_page.dart';
import 'package:direcrot_mobile_new/features/settings/presentation/pages/settings_pages.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key, required this.passed});

  final bool passed;

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();

  final mainNavKey = GlobalKey<NavigatorState>();
  final infoNavKey = GlobalKey<NavigatorState>();
  final contingentNavKey = GlobalKey<NavigatorState>();
  final settingsNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];

  @override
  void initState() {
    super.initState();
    (widget.passed)
        ? null
        : WidgetsBinding.instance.addPostFrameCallback((_) {
            showModalBottomSheet(
                enableDrag: false,
                isDismissible: false,
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return const PinScreen();
                });
          });
    items = [
      NavModel(page: MainPage(), navKey: mainNavKey),
      NavModel(page: InformationPage(), navKey: infoNavKey),
      NavModel(page: ContingentPage(), navKey: contingentNavKey),
      NavModel(page: SettingsPage(), navKey: settingsNavKey)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
                    key: page.navKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.page)
                      ];
                    },
                  ))
              .toList()),
      bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index].navKey.currentState?.popUntil((route) {
                return route.isFirst;
              });
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          }),
    );
  }
}

// class SecondPage extends StatelessWidget {
//   const SecondPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('sad'),
//       ),
//     );
//   }
// }
