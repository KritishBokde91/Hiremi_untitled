import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  State<CustomBottomBar> createState() => _CustombottombarState();
}

class _CustombottombarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17.0, bottom: 20.0, left: 17.0),
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
            bottom: Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                assetPath: 'assets/images/home.png',
                label: 'Home',
                index: 0,
              ),
              _buildNavItem(
                assetPath: 'assets/images/job.png',
                label: 'Jobs',
                index: 1,
              ),
              _buildNavItem(
                assetPath: 'assets/images/expert.png',
                label: 'Ask Expert',
                index: 2,
              ),
              _buildNavItem(
                assetPath: 'assets/images/status.png',
                label: 'Status',
                index: 3,
              ),
              _buildNavItem(
                  assetPath: 'assets/images/hiremi360.png',
                  label: '360',
                  index: 4
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String assetPath,
    required String label,
    required int index,
  }) {
    final isSelected = widget.currentIndex == index;
    return GestureDetector(
      onTap: () {
        widget.onTabSelected(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            height: 24.0,
            width: 24.0,
            color: isSelected ? Colors.blue : const Color(0xFF616161),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
