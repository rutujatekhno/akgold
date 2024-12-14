import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDotsAndArrow extends StatelessWidget {
  final RxInt currentIndex;
  final int totalPages;
  final VoidCallback onNextTap;
  final VoidCallback onPreviousTap; // Add this for previous navigation

  const NavigationDotsAndArrow({
    Key? key,
    required this.currentIndex,
    required this.totalPages,
    required this.onNextTap,
    required this.onPreviousTap, // Add this for previous navigation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Previous arrow (optional)
          if (onPreviousTap != null) // Add this condition
            GestureDetector(
              onTap: onPreviousTap,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff7B3F00),
                ),
                child: const Icon(
                  Icons.arrow_back, // Use arrow_back for previous
                  color: Colors.white,
                ),
              ),
            ),

          Obx(
                () => Row(
              children: List.generate(totalPages, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex.value == index
                        ? const Color(0xff7B3F00)
                        : Colors.white,
                    border: Border.all(
                      color: const Color(0xff7B3F00),
                      width: 1,
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: onNextTap,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff7B3F00),
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}