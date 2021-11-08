import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/paywall_data_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/moritz/moritz_bulletpoints.dart';
import 'package:in_app_purchases_paywall_ui/paywall/moritz/moritz_restore_row.dart';
import 'package:in_app_purchases_paywall_ui/paywall/moritz/moritz_sub_row.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/legal_row.dart';

class MoritzPaywallPurchase extends StatelessWidget {
  MoritzPaywallPurchase();

  @override
  Widget build(BuildContext context) {
    PaywallDataIW paywallData = PaywallDataIW.of(context);
    ThemeData theme = paywallData.theme ?? Theme.of(context);
    return Container(
      decoration: BoxDecoration(color: theme.primaryColor),
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          Card(
            color: theme.scaffoldBackgroundColor,
            margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            elevation: 0,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        PaywallDataIW.of(context).subTitle ?? "",
                        style: theme.textTheme.subtitle1,
                      )),
                  paywallData.campaignWidget != null
                      ? paywallData.campaignWidget!
                      : Container(),
                  MoritzSubRow(),
                  Container(
                    height: 16,
                  ),
                  MoritzBulletPoints(),
                  MoritzRestoreRow(),
                  Container(
                    height: 16,
                  ),
                  LegalRow(theme, paywallData.tosData, paywallData.ppData)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
