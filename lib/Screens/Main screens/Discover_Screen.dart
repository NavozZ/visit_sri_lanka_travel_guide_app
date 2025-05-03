import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/Places.dart';

import 'package:visit_sri_lanka_travel_guide_app/Models/Tours.dart';
import 'package:visit_sri_lanka_travel_guide_app/Providers/Tours_provider.dart';

import 'package:visit_sri_lanka_travel_guide_app/Providers/places_provider.dart';
import 'package:visit_sri_lanka_travel_guide_app/Screens/Main%20screens/profile_screen.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/assets%2FRectangle%2013%201.jpg?alt=media&token=e9aa3f31-2fa1-483d-a347-b6a20d3f0624',
              fit: BoxFit.cover,
            ),
            // Semi-transparent overlay (optional)
            Container(
              color: const Color.fromARGB(255, 56, 55, 55).withOpacity(0.3),
            ),
            // AppBar content
            AppBar(
              foregroundColor: const Color.fromARGB(255, 224, 224, 222),
              backgroundColor: const Color.fromARGB(
                  0, 245, 242, 242), // So image shows through
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Icon(Icons.travel_explore, size: 30, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Visit Sri Lanka",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        // 👈 Move it here
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text('Log Out'),
              onTap: () {
                signout();
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/assets%2Fdownload%20(9)%201.jpg?alt=media&token=b9867aeb-594d-4859-8d51-8f09dedaf78f',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
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
