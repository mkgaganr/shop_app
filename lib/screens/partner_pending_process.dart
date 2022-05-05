import 'package:flutter/material.dart';
import 'package:partner_flutter_app/barcode_scan/widgets/product_search.dart';
import 'package:partner_flutter_app/screens/partner_process_update.dart';
import 'package:partner_flutter_app/state/partner_details_state.dart';
import 'package:partner_flutter_app/state/process_state.dart';
import 'package:partner_flutter_app/state/rfq_partner_price_state.dart';
import 'package:partner_flutter_app/widgets/add_drower.dart';
import 'package:provider/provider.dart';

class PendingOrderProcessScreen extends StatefulWidget {
  static const routeName = '/pending-order-process-screen';
  @override
  _PendingOrderProcessScreen createState() => _PendingOrderProcessScreen();
}

class _PendingOrderProcessScreen extends State<PendingOrderProcessScreen> {
  bool _init = true;
  bool _isLoding = false;
  @override
  void didChangeDependencies() async {
    if (_init) {
      Provider.of<ProcessState>(context).getorderprocesslists();
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
    final data = Provider.of<ProcessState>(context).pendingorderprocess;
    //final process = Provider.of<OrderProcessState>(context).process;
    print('dashboard process data');
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pending Orders"),
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
      body: Padding(
        padding: EdgeInsets.all(1),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (ctx, i) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProcessUpdateScreen.routeName,
                    arguments: data[i].id,
                  );
                },
                title: Text(data[i].processId),
                subtitle: Text(data[i].processName),
              ),
            );
          },
        ),
      ),
    );
  }
}
