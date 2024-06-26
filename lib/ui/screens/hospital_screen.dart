// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, unused_local_variable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, deprecated_member_use, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rate_in_stars/rate_in_stars.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({super.key});

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 50, left: 95),
          child: Text(
            'Hospital',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  leading: const Icon(Icons.search),
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  hintText: 'Search',
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                );
              },
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              },
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: screenHeight * 0.4,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            // child: GoogleMap(
            //   onMapCreated: _onMapCreated,
            //   initialCameraPosition: CameraPosition(
            //     target: _center,
            //     zoom: 11.0,
            //   ),
            // ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 39, 39, 39).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListView(
                children: [
                  Card(
                    color: Color(0xFFFEFEFE),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hospital Name',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingStars(
                                editable: true,
                                rating: 3.5,
                                iconSize: 18,
                                color: Colors.amber,
                              ),
                              Text(
                                "3.5 Stars",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/location_pin.svg",
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(width: 10),
                              Text("3.5 Km"),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/24-7.svg",
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color(0xFFFEFEFE),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hospital Name',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingStars(
                                editable: true,
                                rating: 3.5,
                                iconSize: 18,
                                color: Colors.amber,
                              ),
                              Text(
                                "3.5 Stars",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/location_pin.svg",
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(width: 10),
                              Text("3.5 Km"),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/24-7.svg",
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color(0xFFFEFEFE),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hospital Name',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingStars(
                                editable: true,
                                rating: 3.5,
                                iconSize: 18,
                                color: Colors.amber,
                              ),
                              Text(
                                "3.5 Stars",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/location_pin.svg",
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(width: 10),
                              Text("3.5 Km"),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/24-7.svg",
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color(0xFFFEFEFE),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hospital Name',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingStars(
                                editable: true,
                                rating: 3.5,
                                iconSize: 18,
                                color: Colors.amber,
                              ),
                              Text(
                                "3.5 Stars",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/location_pin.svg",
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(width: 10),
                              Text("3.5 Km"),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/24-7.svg",
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color(0xFFFEFEFE),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hospital Name',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingStars(
                                editable: true,
                                rating: 3.5,
                                iconSize: 18,
                                color: Colors.amber,
                              ),
                              Text(
                                "3.5 Stars",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/location_pin.svg",
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(width: 10),
                              Text("3.5 Km"),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/24-7.svg",
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color(0xFFFEFEFE),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hospital Name',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingStars(
                                editable: true,
                                rating: 3.5,
                                iconSize: 18,
                                color: Colors.amber,
                              ),
                              Text(
                                "3.5 Stars",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/location_pin.svg",
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(width: 10),
                              Text("3.5 Km"),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/24-7.svg",
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color(0xFFFEFEFE),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hospital Name',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingStars(
                                editable: true,
                                rating: 3.5,
                                iconSize: 18,
                                color: Colors.amber,
                              ),
                              Text(
                                "3.5 Stars",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/location_pin.svg",
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(width: 10),
                              Text("3.5 Km"),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/24-7.svg",
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color(0xFFFEFEFE),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hospital Name',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingStars(
                                editable: true,
                                rating: 3.5,
                                iconSize: 18,
                                color: Colors.amber,
                              ),
                              Text(
                                "3.5 Stars",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/location_pin.svg",
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(width: 10),
                              Text("3.5 Km"),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/images/24-7.svg",
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
