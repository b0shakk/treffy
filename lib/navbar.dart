import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treffy_portfolio/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

double collapsableHeight = 0.0;
Color selected = Color(0xffffffff);
Color notSelected = Colors.black;

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        AnimatedContainer(
          margin: EdgeInsets.only(top: 79.0),
          duration: Duration(milliseconds: 375),
          curve: Curves.ease,
          height: (width < 800.0) ? collapsableHeight : 0.0,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: navBarItems,
            ),
          ),
        ),
        Container(
          color: Colors.transparent,
          height: 80.0,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'treffy',
                // style: GoogleFonts.satisfy(color: Colors.black, fontSize: 48),
                style: GoogleFonts.josefinSlab(
                    color: Colors.black,
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -5),
              ),
              LayoutBuilder(builder: (context, constraints) {
                if (width < 800.0) {
                  return NavBarButton(
                    onPressed: () {
                      if (collapsableHeight == 0.0) {
                        setState(() {
                          collapsableHeight = 180.0;
                        });
                      } else if (collapsableHeight == 180.0) {
                        setState(() {
                          collapsableHeight = 0.0;
                        });
                      }
                    },
                  );
                } else {
                  return Row(
                    children: navBarItems,
                  );
                }
              })
            ],
          ),
        ),
      ],
    );
  }
}

List<Widget> navBarItems = [
  NavBarItem(
    text: 'highlights',
    routeName: routeHome,
  ),
  NavBarItem(
    text: 'photographs',
    routeName: routePhotographs,
  ),
  NavBarItem(
    text: 'info',
    routeName: routeContact,
  ),
  // IconButton(
  //     onPressed: () => launch('https://www.instagram.com/b0shakk/'),
  //     icon: FaIcon(FontAwesomeIcons.instagram)),
  // IconButton(onPressed: () {}, icon: Icon(Icons.email_outlined)),
];

class NavBarItem extends StatefulWidget {
  final String text;
  final String routeName;

  NavBarItem({
    required this.text,
    required this.routeName,
  });

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  Color color = notSelected;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          color = selected;
        });
      },
      onExit: (value) {
        setState(() {
          color = notSelected;
        });
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: Colors.black,
          // borderRadius: BorderRadius.circular(14),
          onTap: () {
            navKey.currentState!.pushNamed(widget.routeName);
          },
          child: Container(
            height: 60.0,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              widget.text,
              style: GoogleFonts.ebGaramond(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1),
            ),
          ),
        ),
      ),
    );
  }
}

class NavBarButton extends StatefulWidget {
  final Function onPressed;

  NavBarButton({
    required this.onPressed,
  });

  @override
  _NavBarButtonState createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: 60.0,
      child: Material(
        color: Colors.transparent,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(12.0),
        // ),
        child: InkWell(
          splashColor: Colors.black,
          onTap: () {
            setState(() {
              widget.onPressed();
            });
          },
          child: Icon(
            Icons.menu,
            size: 30.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
