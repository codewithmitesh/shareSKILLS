import 'package:flutter/material.dart';

class HomePageHelpers with ChangeNotifier {
  Widget bottomNavBar(
      int index, PageController pageController, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
            )
          ],
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          buildNavBarItem(Icons.home, 0, pageController, context),
          buildNavBarItem(Icons.search, 1, pageController, context),
          // buildNavBarItem(null, -1),
          buildNavBarItem(Icons.notifications, 2, pageController, context),
          buildNavBarItem(Icons.person, 3, pageController, context),
        ],
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index,
      PageController pageController, BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageController.jumpToPage(index);
        notifyListeners();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        // width: 64,
        height: 45,
        child: icon != null
            ? Icon(
                icon,
                size: 25,
                color: index == index ? Colors.black : Colors.grey[700],
              )
            : Container(),
      ),
    );
  }
}
