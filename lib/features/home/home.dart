import 'package:flutter/material.dart';



// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late PageController homePageController;

//   // late BannerAd bannerAd;
//   // late InterstitialAd interstitialAd;
//   var index = 0;

//   @override
//   void initState() {
//     homePageController = PageController(keepPage: true);
//     // isLoading = true;
//     // bannerAd = BannerAd(
//     //   size: AdSize.banner,
//     //   adUnitId: AdHelper.bannerAdUnitId,
//     //   listener: BannerAdListener(
//     //     onAdLoaded: (_) {
//     //       setState(() {
//     //         isLoading = false;
//     //       });
//     //     },
//     //     onAdFailedToLoad: (ad, err) {
//     //       ad.dispose();
//     //     },
//     //   ),
//     //   request: const AdRequest(),
//     // );
//     //
//     // InterstitialAd.load(
//     //   adUnitId: AdHelper.interstitialAdUnitId,
//     //   request: const AdRequest(),
//     //   adLoadCallback: InterstitialAdLoadCallback(
//     //     onAdLoaded: (ad) {
//     //       ad.show();
//     //     },
//     //     onAdFailedToLoad: (err) {},
//     //   ),
//     // ).then((value) {});
//     //
//     // bannerAd.load();
//     super.initState();
//   }

//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => BnbBloc(),
//       child: BlocBuilder<BnbBloc, BnbState>(
//         builder: (context, state) {
//           return Scaffold(
//             body: Column(children: [
//               Expanded(
//                 child: IndexedStack(
//                   index: index,
//                   children: const [
//                     DestinationPage(
//                       onGenerateRoute: TaskRoute.onGenerateRoute,
//                     ),
//                     // DestinationPage(
//                     //   onGenerateRoute: ExpenseRoute.onGenerateRoute,
//                     // ),
//                     DestinationPage(
//                       onGenerateRoute: CreateRoute.onGenerateRoute,
//                     ),
//                     DestinationPage(
//                       onGenerateRoute: CreateRoute.onGenerateRoute,
//                     ),
//                     DestinationPage(
//                       onGenerateRoute: CreateRoute.onGenerateRoute,
//                     ),
//                     DestinationPage(
//                       onGenerateRoute: CalendarRoute.onGenerateRoute,
//                     ),
//                     // DestinationPage(
//                     //   onGenerateRoute: StatsRoute.onGenerateRoute,
//                     // ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).padding.bottom),
//                 decoration: BoxDecoration(
//                   color: context.colors.bnbColor,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(24),
//                     topRight: Radius.circular(24),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         BnbItem(
//                             index: 0,
//                             icon: AppIcons.tasks,
//                             title: "con",
//                             onTap: () {
//                               index = 0;
//                               context
//                                   .read<BnbBloc>()
//                                   .add(IsActiveColor(index: 0, isActive: true));
//                             }),
//                         BnbItem(
//                             index: 1,
//                             icon: AppIcons.expense,
//                             title: "context",
//                             onTap: () {
//                               index = 1;
//                               context
//                                   .read<BnbBloc>()
//                                   .add(IsActiveColor(index: 1, isActive: true));
//                             }),
//                         BnbItem(
//                             index: 2,
//                             icon: AppIcons.expense,
//                             title: "cont ",
//                             onTap: () {
//                               index = 2;
//                               context
//                                   .read<BnbBloc>()
//                                   .add(IsActiveColor(index: 2, isActive: true));
//                             }),
//                         BnbItem(
//                             index: 3,
//                             icon: AppIcons.calendar,
//                             title: "conte",
//                             onTap: () {
//                               index = 3;
//                               context
//                                   .read<BnbBloc>()
//                                   .add(IsActiveColor(index: 3, isActive: true));
//                             }),
//                         BnbItem(
//                           index: 4,
//                           icon: AppIcons.stats,
//                           title: "cont",
//                           onTap: () {
//                             index = 4;
//                             context
//                                 .read<BnbBloc>()
//                                 .add(IsActiveColor(index: 4, isActive: true));
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ]),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     homePageController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:med_project/core/routes/asosiy.dart';
import 'package:med_project/core/routes/calendar.dart';
import 'package:med_project/core/routes/chat.dart';
import 'package:med_project/core/routes/maqola.dart';
import 'package:med_project/core/routes/profile.dart';
import 'package:med_project/features/home/widgets/destination_page.dart';
import 'package:med_project/features/home/widgets/nav_bar.dart';




class HomePage extends HookWidget {
  HomePage({super.key});
  final List<Widget> pages =   [
       DestinationPage(
                      onGenerateRoute: AsosiyRoute.onGenerateRoute,
                    ),
                    DestinationPage(
                      onGenerateRoute: MaqolaRoute.onGenerateRoute,
                    ),
                    DestinationPage(
                      onGenerateRoute: ChatRoute.onGenerateRoute,
                    ),
                    DestinationPage(
                      onGenerateRoute: CalendarRoute.onGenerateRoute,
                    ),
                    DestinationPage(
                      onGenerateRoute: ProfileRoute.onGenerateRoute,
                    ),
  ];
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final selectedIndex = useState(0);
    final pageController = PageController(initialPage: selectedIndex.value);

    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: MainNavigationBar(
        action: (value) =>
            _onPageSelected(value, pageController, selectedIndex, scaffoldKey),
        selectedIndex: selectedIndex.value,
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) =>
            _onPageSelected(value, pageController, selectedIndex, scaffoldKey),
        children: pages,
      ),
    );
  }

  void _onPageSelected(int value, PageController pageController,
      ValueNotifier<int> selectedIndex, GlobalKey<ScaffoldState> scaffoldKey) {

    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    selectedIndex.value = value;
  }
}
