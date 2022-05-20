import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF6158e6),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getSideBarContent(() {}, 'Home'),
              getPadding(),
              getSideBarContent(() {}, 'About'),
              getPadding(),
              getSideBarContent(() {}, 'Read'),
              getPadding(),
              getSideBarContent(() {}, 'Contact Us'),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2021 | David-oH',
                    style: TextStyle(
                      color: Colors.blueGrey.shade300,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

InkWell getSideBarContent(Function ontapped, String text) {
  return InkWell(
    onTap: () {},
    child: const Text(
      'Contact Us',
      style: TextStyle(color: Colors.white, fontSize: 22),
    ),
  );
}

Padding getPadding() {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
    child: Divider(
      color: Colors.blueGrey.shade400,
      thickness: 2,
    ),
  );
}
