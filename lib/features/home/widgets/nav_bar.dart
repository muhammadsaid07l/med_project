import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_project/assets/icons.dart';
class MainNavigationBar extends StatelessWidget {
  final Function(int index) action;
  final int selectedIndex;
  const MainNavigationBar({
    super.key,
    required this.action,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Ink(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey[600],
          items: [
            BottomNavigationBarItem(
              label: "Asosiy",
              icon: SvgPicture.asset(selectedIndex != 0
                  ? AppIcons.asosiy
                  : AppIcons.selectedAsosiy),
            ),
            BottomNavigationBarItem(
              label: "Maqolalar",
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(selectedIndex != 1
                  ? AppIcons.maqola
                  : AppIcons.selectedMaqola),
            ),
            BottomNavigationBarItem(
              label: "Chat",
              icon: SvgPicture.asset(
                  selectedIndex != 2 ? AppIcons.chat : AppIcons.selectedChat),
            ),
            BottomNavigationBarItem(
              label: "Kalendar",
              icon: SvgPicture.asset(
                  selectedIndex != 3 ? AppIcons.kalendar : AppIcons.kalendar),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: SvgPicture.asset(
                  selectedIndex != 4 ? AppIcons.profile : AppIcons.profile),
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (value){action(value);
     
          },
        ),
      ),
    );
  }
}
