import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/browse_controller.dart';
import '../../../widgets/custom_bottom_navbar.dart';
import '../../../data/job_data.dart'; // Import your job data

class BrowseView extends StatelessWidget {
  final BrowseController controller = Get.put(BrowseController());

  @override
  Widget build(BuildContext context) {
    // Filter recommended jobs from jobList
    List<Job> recommendedJobs = jobList.where((job) => job.isRecommended).toList();

    return DefaultTabController(
      length: 2, // Two tabs: Categories and Recommendations
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Browse Jobs',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Categories'),
              Tab(text: 'Recommendations'),
            ],
            indicatorColor: Color(0xFF1230AE), // Tab indicator color
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Job Categories
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.search, size: 24, color: Colors.grey),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Job title or keyword',
                                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 24, color: Colors.grey),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Malang, Indonesia',
                                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Search my job', style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor: Color(0xFF1230AE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Obx(() {
                      return ListView.builder(
                        itemCount: controller.jobCategories.length + 1,
                        itemBuilder: (context, index) {
                          if (index < controller.jobCategories.length) {
                            final category = controller.jobCategories[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed('/browse-2', arguments: category.name);
                              },
                              child: Card(
                                margin: const EdgeInsets.only(bottom: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Image.asset(category.iconPath, height: 40, width: 40),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              category.name,
                                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              category.availableJobs,
                                              style: TextStyle(color: Colors.grey.shade600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed('/browse-2', arguments: 'All');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text('Show all jobs', style: TextStyle(color: Color(0xFF1230AE), fontSize: 16, fontWeight: FontWeight.bold)),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_forward, color: Color(0xFF1230AE)),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Tab 2: Recommended Jobs
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: recommendedJobs.length,
                itemBuilder: (context, index) {
                  final job = recommendedJobs[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/browse-3', arguments: job);
                    },
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  job.companyLogoPath,
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        job.position,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${job.companyName}, ${job.location}',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        job.jobType,
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        job.categories.join(", "),
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Website: ${job.jobDetails.companyDetails.website}',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
