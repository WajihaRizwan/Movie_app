import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movieapp/models/moviemodel.dart';
import 'package:movieapp/services/services.dart';
import 'package:movieapp/widgets/movie_card.dart';
import 'package:movieapp/widgets/movie_detail.dart';
import 'package:movieapp/widgets/my_profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<MovieModel> upcomingFuture;
  late Future<MovieModel> nowplayingFuture;
  ApiServices apiServices = ApiServices();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    upcomingFuture = apiServices.getUpcomingMovies();
    nowplayingFuture = apiServices.getNowPlayingMovies();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 4) { // Assuming Profile is the fifth item
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  MyProfile()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> carouselItems = [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MovieDetail()),
          );
        },
        child: Center(child: Image.asset('asessts/cpamerica.jpg')),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MovieDetail()),
          );
        },
        child: Center(child: Image.asset('asessts/cpamerica.jpg')),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MovieDetail()),
          );
        },
        child: Center(child: Image.asset('asessts/cpamerica.jpg')),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: carouselItems,
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 210,
                child: MovieCardWidget(
                  future: upcomingFuture,
                  headLineText: 'Upcoming Movies',
                ),
              ),
              SizedBox(
                height: 210,
                child: MovieCardWidget(
                  future: nowplayingFuture,
                  headLineText: 'Now Playing Movies',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0A0E21),
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Downloads'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text("Profile"),
      ),
      body: const Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text("Movie Details"),
      ),
      body: const Center(
        child: Text(
          "Movie Details Screen",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
