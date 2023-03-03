import 'package:dialogflowchatbot/chatScreen.dart';
import 'package:dialogflowchatbot/constants/constants.dart';
import 'package:dialogflowchatbot/live_tracking.dart';
// import 'package:bltcc/views/asset_list.dart';
// import 'package:bltcc/views/driver_list.dart';
// import 'package:bltcc/views/history_tracking.dart';
// import 'package:bltcc/views/tracking_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StaggeredGridView.extent(
            maxCrossAxisExtent: Get.width / 2,
            scrollDirection: Axis.vertical,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => LiveTracking());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_off_sharp),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Nearby Hospitals')
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ChatScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat_rounded),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Chat')
                    ],
                  ),
                ),
              ),
            ],
            staggeredTiles: const [
              StaggeredTile.count(1, 0.7),
              StaggeredTile.count(1, 0.7),
            ],
          )
        ],
      ),
    );
  }
}
