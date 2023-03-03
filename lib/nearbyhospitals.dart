import 'package:flutter/material.dart';

import '../widgets/asset_widget.dart';

class TrackingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tracking')),
      body: ListView.builder(itemBuilder: ((context, index) {
        return AssetWidget(
          navigateTo: '/live_tracking',
        );
      })),
    );
  }
}
