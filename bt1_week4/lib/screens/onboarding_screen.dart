import 'package:flutter/material.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_page.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: "Easy Time Management",
      description:
      "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first",
      imageAsset: 'assets/images/time.jpg',
    ),
    OnboardingModel(
      title: "Increase Work Effectiveness",
      description:
      "Time management and the determination of more important tasks will give your job statistics better and always improve.",
      imageAsset: 'assets/images/effectiveness.png',
    ),
    OnboardingModel(
      title: "Reminder Notification",
      description:
      "The advantage of this application is that it also provides reminders for you so you don’t forget to keep doing your assignments well and according to the time you have set.",
      imageAsset: 'assets/images/reminder.jpg',
    ),
  ];

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      _controller.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeScreen()));
    }
  }

  void _skip() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pages.length, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: _currentPage == index ? 16 : 8,
          decoration: BoxDecoration(
            color:
            _currentPage == index ? Colors.blue : Colors.blue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (_, index) => OnboardingPage(model: pages[index]),
          ),

          // Page indicators
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: SafeArea(child: buildIndicator()),
          ),

          // Skip button
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: _skip,
              child: Text(
                "skip",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ),

          // Navigation buttons
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: _currentPage == 0
                ? ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text("Next", style: TextStyle(fontSize: 16)),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button
                ElevatedButton(
                  onPressed: () {
                    _controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(14),
                    backgroundColor: Colors.blue,
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),

                // Next / Get Started button
                Expanded(
                  child: ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      _currentPage == pages.length - 1
                          ? "Get Started"
                          : "Next",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
