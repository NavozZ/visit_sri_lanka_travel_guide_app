import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/Places.dart';

import 'package:visit_sri_lanka_travel_guide_app/Models/Tours.dart';
import 'package:visit_sri_lanka_travel_guide_app/Providers/Tours_provider.dart';

import 'package:visit_sri_lanka_travel_guide_app/Providers/places_provider.dart';
import 'package:visit_sri_lanka_travel_guide_app/utils/app_colors.dart';

import 'package:visit_sri_lanka_travel_guide_app/widgets/TourCard.dart';
import 'package:visit_sri_lanka_travel_guide_app/widgets/carousel_slider.dart';
import 'package:visit_sri_lanka_travel_guide_app/widgets/placeCard.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<String> imgList = [
    'https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/Carousel%20Images%2Fbeach.png?alt=media&token=dd8c562e-8b9b-47bd-9680-225dab17a987',
    'https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/Carousel%20Images%2Fkandy.png?alt=media&token=b6eed8ea-9cf6-4620-bb68-4fbb645f6432',
    'https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/Carousel%20Images%2Fsigiriya.png?alt=media&token=fcf03fe7-50c2-4eb2-9770-04e7739fa995',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/assets%2Fdownload%20(9)%201.jpg?alt=media&token=b9867aeb-594d-4859-8d51-8f09dedaf78f',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.backgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0.2, right: 20, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.person,
                                size: 30,
                              ),
                              Text(
                                "NavozZ",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          signout();
                        },
                        child: Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Carousel_slider(imgList: imgList),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text("Best Places",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'IslandMoments-Regular',
                            height: 1.2,
                          )),
                      Text("TO VISIT",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: Consumer<PlacesProvider>(
                    builder: (context, placesProvider, child) {
                      print(placesProvider.placesData);
                      List<Places> allPlacesData = placesProvider.placesData;

                      return allPlacesData.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: allPlacesData.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return PlaceCard(
                                  placesData: allPlacesData[index],
                                );
                              },
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text("Our Most",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'IslandMoments-Regular',
                            height: 1.2,
                          )),
                      Text("Popular Tours",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: Consumer<ToursProvider>(
                    builder: (context, toursProvider, child) {
                      print(toursProvider.toursData);
                      List<Tours> allToursData = toursProvider.toursData;

                      return allToursData.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: allToursData.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return TourCard(
                                  toursData: allToursData[index],
                                );
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future signout() async {
    await FirebaseAuth.instance.signOut();
  }
}



// SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       TourCard(
//                         imageUrl:
//                             'https://inooki.com/wp-content/uploads/2024/03/Mob2-533x500-1.jpg',
//                         tourName: "Down South Tour",
//                         category: "per person",
//                         price: "100",
//                       ),
//                       TourCard(
//                         imageUrl:
//                             'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/06/d7/27/d9.jpg',
//                         tourName: "Ancient Cities Tour",
//                         category: "per person",
//                         price: "100",
//                       ),
//                       TourCard(
//                         imageUrl:
//                             'https://helanka.co/wp-content/uploads/2024/09/Sri-Lanka-Hill-Country-Tours.jpg',
//                         tourName: "Hill Country Tour",
//                         category: "per person",
//                         price: "100",
//                       ),
//                       TourCard(
//                         imageUrl:
//                             'https://www.onthegotours.com/repository/Leopard--Sri-Lanka--On-The-Go-Tours-325451478099864.jpg',
//                         tourName: "Wildlife & Nature Tour",
//                         category: "per person",
//                         price: "100",
//                       ),
//                     ],
//                   ),
//                 ),