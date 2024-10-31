import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetail> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image and Back Button
            Stack(
              children: [
                Image.asset(
                  'asessts/k42Owka8v91trK1qMYwCQCNwJKr.jpg', // Replace with your image URL
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            // Movie Title and Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Venom",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white),
                     
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "2019 • Adventure, Comedy • 2h 8m",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Venom: The Last Dance is a 2024 American superhero film written and directed by Kelly Marcel, which features the Marvel Comics character Venom. The final installment of the Venom trilogy following Venom (2018) and Venom:...",
                    style: TextStyle(color: Colors.white70),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Implement Play functionality
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: const Row(
                          children: [
                            Icon(Icons.play_arrow),
                            SizedBox(width: 8),
                            Text("Play"),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {
                          // Implement Download functionality
                        },
                        style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
                        child: const Row(
                          children: [
                            Icon(Icons.download),
                            SizedBox(width: 8),
                            Text("Download"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Tab Bar
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: "Episode"),
                Tab(text: "Similar"),
                Tab(text: "About"),
              ],
              indicatorColor: Colors.red,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.white,
            ),
            // Tab Views
          SizedBox(
              height: 400, // Set height as needed
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Episode Tab
                  ListView.builder(
                    padding: const EdgeInsets.all(12.0),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C1C2D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              // Thumbnail
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'asessts/images.jpeg', // Replace with actual image URL
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              
                              const SizedBox(width: 16),
                              
                              // Title and Description
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Trailer",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Aladdin, a street boy who falls in love with a princess. With differences in caste and wealth, Aladdin tries to find...",
                                      style: TextStyle(color: Colors.white70),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              // Play and Download Icons
                              Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.play_circle_fill, color: Colors.red),
                                    onPressed: () {
                                      // Implement play functionality
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.download, color: Colors.white),
                                    onPressed: () {
                                      // Implement download functionality
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // Similar Tab
                  
                  ListView.builder(
                    padding: const EdgeInsets.all(12.0),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C1C2D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              // Thumbnail
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'asessts/images.jpeg', // Replace with actual image URL
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              
                              const SizedBox(width: 16),
                              
                              // Title and Description
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Trailer",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Aladdin, a street boy who falls in love with a princess. With differences in caste and wealth, Aladdin tries to find...",
                                      style: TextStyle(color: Colors.white70),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              // Play and Download Icons
                              Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.play_circle_fill, color: Colors.red),
                                    onPressed: () {
                                      // Implement play functionality
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.download, color: Colors.white),
                                    onPressed: () {
                                      // Implement download functionality
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // About Tab
                  
                  ListView.builder(
                    padding: const EdgeInsets.all(12.0),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C1C2D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              // Thumbnail
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'asessts/images.jpeg', // Replace with actual image URL
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              
                              const SizedBox(width: 16),
                              
                              // Title and Description
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Trailer",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Aladdin, a street boy who falls in love with a princess. With differences in caste and wealth, Aladdin tries to find...",
                                      style: TextStyle(color: Colors.white70),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              // Play and Download Icons
                              Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.play_circle_fill, color: Colors.red),
                                    onPressed: () {
                                      // Implement play functionality
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.download, color: Colors.white),
                                    onPressed: () {
                                      // Implement download functionality
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
          
