import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner_flutter_app/barcode_scan/widgets/product_search.dart';
import 'package:partner_flutter_app/bottom_nav_screens/bottom_nav_home.dart';
import 'package:partner_flutter_app/bottom_nav_screens/bottom_nav_pending_order.dart';
import 'package:partner_flutter_app/screens/partner_dashboard.dart';
import 'package:partner_flutter_app/state/partner_details_state.dart';
import 'package:partner_flutter_app/state/process_state.dart';
import 'package:partner_flutter_app/state/rfq_partner_price_state.dart';
import 'package:partner_flutter_app/widgets/add_drower.dart';
import 'package:provider/provider.dart';
import 'package:bmnav/bmnav.dart' as bmnav;

class HomeScreens extends StatefulWidget {
  static const routeName = '/home-screens';

  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  bool _init = true;
  bool _isLoding = false;

  int currentTab = 0;
  final List<Widget> screens = [
    BNdashboard(),
    BNPendingOrderProcessScreen(),
    PartnerDashboard(),
    BNdashboard()
  ];
  Widget currentScreen = BNdashboard();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  void didChangeDependencies() async {
    if (_init) {
      Provider.of<ProcessState>(context).getorderprocesslists();
      Provider.of<ProcessState>(context).getorderprocessnowlists();
      Provider.of<ProcessState>(context).getorderprocessupcominglists();
      Provider.of<ProcessState>(context).getorderprocessoverduelists();
      Provider.of<RfqPartnerPriceState>(context).getRFQlists();
      Provider.of<GetPartnerDetails>(context).getcompanydetails();

      _isLoding = true;
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoding)
      return Scaffold(
        backgroundColor: Color(0xff392850),
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: Center(
          child: Text("Please check internet connection or!"),
        ),
      );
    else
      return Scaffold(
        backgroundColor: Color(0xfff3f3f3),
        appBar: AppBar(
          title: Text("Dashboard"),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: ProductSearch());
              },
            ),
          ],
        ),
        drawer: AppDrower(),
        body: PageStorage(child: currentScreen, bucket: bucket),
        bottomNavigationBar: bmnav.BottomNav(
          index: currentTab,
          labelStyle: bmnav.LabelStyle(visible: false),
          onTap: (i) {
            setState(() {
              currentTab = i;
              currentScreen = screens[i];
            });
          },
          items: [
            bmnav.BottomNavItem(Icons.home_outlined),
            bmnav.BottomNavItem(Icons.shopping_cart_outlined),
            bmnav.BottomNavItem(Icons.notification_add_outlined),
            bmnav.BottomNavItem(Icons.view_headline)
          ],
        ),
      );
  }
}
