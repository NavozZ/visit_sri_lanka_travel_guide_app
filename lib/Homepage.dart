import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visit_sri_lanka_travel_guide_app/Providers/Tours_provider.dart';
import 'package:visit_sri_lanka_travel_guide_app/Providers/places_provider.dart';
import 'package:visit_sri_lanka_travel_guide_app/Screens/Main%20screens/Alert_Screen.dart';
import 'package:visit_sri_lanka_travel_guide_app/Screens/Main%20screens/Discover_Screen.dart';
import 'package:visit_sri_lanka_travel_guide_app/Screens/Main%20screens/Places_screen.dart';
import 'package:visit_sri_lanka_travel_guide_app/Screens/Main%20screens/Tours_screen.dart';
import 'package:visit_sri_lanka_travel_guide_app/Screens/Main%20screens/events_screen.dart';
import 'package:visit_sri_lanka_travel_guide_app/services/firebase_services.dart';
import 'package:visit_sri_lanka_travel_guide_app/utils/app_colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int screenNo = 0;

  List<Widget> screenList = const [
    DiscoverScreen(),
    PlacesScreen(),
    ToursScreen(),
    EventsScreen(),
    AlertScreen()

    // MessageScreen(),
  ];

  @override
  void initState() {
    super.initState();

    // Delay to ensure context is available
    Future.microtask(() async {
      try {
        final placesData = await FirebaseServices.getPlaces();
        context.read<PlacesProvider>().addPlaces(places: placesData);

        final toursData = await FirebaseServices.getTours();
        context.read<ToursProvider>().addTours(tours: toursData);
      } catch (e) {
        print("Error loading data: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screenList[screenNo],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
            children: [
              // Background image
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/assets%2FRectangle%2013%201.jpg?alt=media&token=e9aa3f31-2fa1-483d-a347-b6a20d3f0624',
                  width: double.infinity,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),

              // Navigation bar content with semi-transparent background
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.primaryColor
                      .withOpacity(0.8), // Optional overlay
                ),
                height: 60,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      bottomNavigationIcon(
                        icon: Icons.favorite,
                        iconText: "Discover",
                        index: 0,
                      ),
                      bottomNavigationIcon(
                          icon: Icons.edit, iconText: "Places", index: 1),
                      bottomNavigationIcon(
                          icon: Icons.shopping_bag,
                          iconText: "Tours",
                          index: 2),
                      bottomNavigationIcon(
                          icon: Icons.newspaper, iconText: "Events", index: 3),
                      bottomNavigationIcon(
                          icon: Icons.newspaper, iconText: "News", index: 4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget bottomNavigationIcon(
      {required IconData icon, required String iconText, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          screenNo = index;
        });
        print(screenNo);
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: screenNo == index ? Colors.white : Colors.grey,
            size: screenNo == index ? 23 : 18,
          ),
          Text(
            iconText,
            style: TextStyle(
                color: screenNo == index ? Colors.white : Colors.grey),
          ),
        ],
      ),
    );
  }
  // Future signout() async {
  //   await FirebaseAuth.instance.signOut();
  // }
}

      // body: Center(
      //     child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     InkWell(
      //       onTap: () {
      //         signout();
      //       },
      //       child: Icon(
      //         Icons.logout,
      //         color: Colors.black,
      //       ),
      //     ),
      

  // Future signout() async {
  //   await FirebaseAuth.instance.signOut();
  // }