import 'package:flutter/material.dart';
import 'package:partner_flutter_app/screens/home_Screens.dart';
import 'package:partner_flutter_app/screens/login_screens.dart';
import 'package:partner_flutter_app/screens/partner_completed_process.dart';
import 'package:partner_flutter_app/screens/partner_dashboard.dart';
import 'package:partner_flutter_app/screens/partner_pending_process.dart';
import 'package:partner_flutter_app/screens/partner_process_update.dart';
import 'package:partner_flutter_app/screens/partner_process_details.dart';
import 'package:partner_flutter_app/screens/register_screens.dart';
import 'package:partner_flutter_app/screens/rfq_partner_update_screen.dart';
import 'package:partner_flutter_app/screens/rfq_partner_price.dart';
import 'package:partner_flutter_app/screens/pdf_viewer_screen.dart';
import 'package:partner_flutter_app/screens/test.dart';
import 'package:partner_flutter_app/state/partner_details_state.dart';
import 'package:partner_flutter_app/state/process_state.dart';
import 'package:partner_flutter_app/state/rfq_partner_price_state.dart';
import 'package:partner_flutter_app/state/user_state.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalStorage storage = new LocalStorage('usertoken');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserState()),
        ChangeNotifierProvider(create: (ctx) => ProcessState()),
        ChangeNotifierProvider(create: (ctx) => RfqPartnerPriceState()),
        ChangeNotifierProvider(create: (ctx) => GetPartnerDetails()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: storage.ready,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (storage.getItem('token') == null) {
              return LoginScrrens();
            }
            return HomeScreens();
          },
        ),
        routes: {
          HomeScreens.routeName: (ctx) => HomeScreens(),
          LoginScrrens.routeName: (ctx) => LoginScrrens(),
          RegisterScreens.routeName: (ctx) => RegisterScreens(),
          PartnerDashboard.routeName: (ctx) => PartnerDashboard(),
          RfqPartner.routeName: (ctx) => RfqPartner(),
          PdfViewerScreen.routeName: (ctx) => PdfViewerScreen(),
          ProcessDetailsScreens.routeName: (ctx) => ProcessDetailsScreens(),
          ProcessUpdateScreen.routeName: (ctx) => ProcessUpdateScreen(),
          RfqPartnerDetailScreen.routeName: (ctx) => RfqPartnerDetailScreen(),
          CompletedOrderProcessScreen.routeName: (ctx) =>
              CompletedOrderProcessScreen(),
          PendingOrderProcessScreen.routeName: (ctx) =>
              PendingOrderProcessScreen(),
          Test.routeName: (ctx) => Test(),
        },
      ),
    );
  }
}
