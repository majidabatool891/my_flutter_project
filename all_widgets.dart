import 'package:flutter/material.dart';

class ReusableHomeCard extends StatelessWidget {
  final IconData myIcon;
  final String text;
  final Color cardColor;
  final Color iconColor;
  final Color textColor;
  const ReusableHomeCard({
    super.key,
    required this.myIcon,
    required this.text,
    required this.cardColor,
    required this.iconColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(myIcon, size: 30, color: iconColor),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  final Color boxColor;
  final Color borderColor;
  final String categoriesText;
  const CategoriesCard({
    super.key,
    required this.boxColor,
    required this.borderColor,
    required this.categoriesText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: boxColor,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Text(
            categoriesText,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class SettingButtons extends StatelessWidget {
  final Color boxBg;
  final IconData leftIcon;
  final String settingText;
  final IconData rightIcon;
  const SettingButtons({
    super.key,
    required this.boxBg,
    required this.leftIcon,
    required this.settingText,
    required this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: boxBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(leftIcon, size: 28, color: Colors.indigo),
          const SizedBox(width: 12),

          Text(
            settingText,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),

          const Spacer(),

          Icon(rightIcon, size: 28, color: Colors.indigo),
        ],
      ),
    );
  }
}

class PushButton extends StatelessWidget {
  final String pushButtonText;
  final String? routeName;
  final bool replaceCurrentRoute;
  const PushButton({
    super.key,
    required this.pushButtonText,
    this.routeName,
    this.replaceCurrentRoute = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if(routeName == null){
              if(Navigator.canPop(context)){
                Navigator.pop(context);
              }
            }else if(replaceCurrentRoute){
              Navigator.pushReplacementNamed(context, routeName!);
            }else{
              Navigator.pushNamed(context, routeName!);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 136, 164, 188),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 17),
            side: const BorderSide(
              color: Color.fromARGB(255, 199, 159, 28),
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            pushButtonText,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}

class AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leftIcon;
  final String appBarText;
  final IconData? rightIcon;

  const AppBarSection({
    super.key,
    this.leftIcon,
    required this.appBarText,
    this.rightIcon,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      leading: leftIcon != null ? Icon(leftIcon) : null,
      title: Text(
        appBarText,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [if (rightIcon != null) Icon(rightIcon)],
    );
  }
}
