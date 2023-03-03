// import 'package:bltcc/views/asset_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class AssetWidget extends StatefulWidget {
  final String navigateTo;
  const AssetWidget({required this.navigateTo});

  @override
  State<AssetWidget> createState() => _AssetWidgetState();
}

class _AssetWidgetState extends State<AssetWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(widget.navigateTo);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Theme.of(context).dividerColor)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Checkbox(
              value: isChecked,
              onChanged: (val) {
                setState(() {
                  isChecked = !isChecked;
                });
              }),
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: primary)),
                  child: SvgPicture.asset(
                    'assets/truck.svg',
                    height: 40,
                    color: primary,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'UAR 127',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: primary),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Available',
                                  style: TextStyle(color: primary),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Mercedes Benz MCV 600 Bus',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('MBM - QSGTL'),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 14,
          )
        ]),
      ),
    );
  }
}
