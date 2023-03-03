import 'package:dialogflowchatbot/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../helpers/method_helpers.dart';

class LiveTracking extends StatefulWidget {
  @override
  State<LiveTracking> createState() => _LiveTrackingState();
}

class _LiveTrackingState extends State<LiveTracking> {
  GoogleMapController? googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  String selected = 'Normal';
  List<String> types = ['Normal', 'Satelite', 'Hybrid'];

  void loadMarker() async {
    try {
      markers[MarkerId("2")] = Marker(
        position: LatLng(0.34279, 32.59351),
        markerId: MarkerId("2"),
        draggable: true,
        onTap: () {
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              builder: (_) {
                return Container(
                  height: 400,
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Driver',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          'Adam',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Last position',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          '2022/12/01 09:00:00',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Location',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          'Kampala',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Coordinates',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          '32.581111, 0.313611',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'vehicle speed',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          '20km/hr',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ignition on/off',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          'On',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Asset',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          'Mercedes Benz MCV 600 Bus',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              Get.toNamed('/asset_details');
                            },
                            child: Text('Go to asset')),
                      ],
                    )
                  ]),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                );
              });
        },
        infoWindow: InfoWindow(title: 'UAX 200'),
      );
    } catch (_) {}

    if (mounted) {
      setState(() {});
      animateToBounds();
    }
  }

  void animateToBounds() async {
    LatLngBounds latLngBounds =
        MethodHelpers.getBounds([markers[MarkerId("2")]!]);
    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(latLngBounds, 70);

    await googleMapController?.animateCamera(cameraUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            indoorViewEnabled: true,
            buildingsEnabled: true,
            zoomGesturesEnabled: true,
            markers: Set<Marker>.of(markers.values),
            mapType: selected == 'Normal'
                ? MapType.normal
                : selected == 'Satelite'
                    ? MapType.satellite
                    : MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: LatLng(0.34279, 32.59351),
            ),
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
              loadMarker();
            },
          ),
          Positioned(
              top: 20 + MediaQuery.of(context).padding.top,
              left: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Get.close(1);
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: primary, shape: BoxShape.circle),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                            )),
                        padding: EdgeInsets.all(14),
                        child: DropdownButton<String>(
                          value: selected,
                          items: types
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          isExpanded: false,
                          isDense: true,
                          underline: Container(),
                          onChanged: (value) {
                            setState(() {
                              selected = value!;
                            });
                          },
                        ),
                      )
                    ]),
              ))
        ],
      ),
    );
  }
}
