import 'package:flutter/material.dart';

final List _isHovering = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

class TopBarContents extends StatefulWidget {
  final double opacity;

  const TopBarContents(this.opacity, {Key? key}) : super(key: key);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.white.withOpacity(widget.opacity),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSize.width / 5,
                  ),
                  const Text(
                    'Author',
                    style: TextStyle(
                      color: Color(0xFF077bd7),
                      fontSize: 26,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(width: screenSize.width / 15),
                  getHeaderText('Home', 0, (value) {
                    setState(() {
                      value ? _isHovering[0] = true : _isHovering[0] = false;
                    });
                  }),
                  SizedBox(width: screenSize.width / 15),
                  getHeaderText('History', 1, (value) {
                    setState(() {
                      value ? _isHovering[1] = true : _isHovering[1] = false;
                    });
                  }),
                  SizedBox(width: screenSize.width / 15),
                  getHeaderText('Contact', 2, (value) {
                    setState(() {
                      value ? _isHovering[2] = true : _isHovering[2] = false;
                    });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getHeaderText(String text, int i, Function(bool) onhover) {
  return InkWell(
    onHover: onhover,
    onTap: () {},
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
              color: _isHovering[i]
                  ? const Color(0xFF077bd7)
                  : const Color(0xFF077bd7),
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        const SizedBox(height: 5),
        Visibility(
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          visible: _isHovering[i],
          child: Container(
            height: 2,
            width: 20,
            color: Colors.blue,
          ),
        )
      ],
    ),
  );
}
