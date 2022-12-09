import 'package:flutter/material.dart';
import 'package:flutter_website/components/colors.dart';
import 'package:flutter_website/components/typography.dart';
import 'package:flutter_website/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuBar extends StatelessWidget {
  final ItemScrollController itemScrollController;

  const MenuBar({
    Key? key,
    required this.itemScrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color navLinkColor = Colors.white;
    return Container(
      height: 66,
      //decoration: const BoxDecoration(color: background),
      decoration: const BoxDecoration(color: Color.fromRGBO(234, 33, 46, 1)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 16, 5),
                child: Image.asset("assets/images/dinamica/Dinamica.png",
                    height: 60, fit: BoxFit.contain),
              ),
            ),
          ),
          const Spacer(),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  itemScrollController.scrollTo(
                      index: 0,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOutCubic);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Inicio",
                      style: TextStyle(
                          fontSize: 16,
                          color: navLinkColor,
                          fontFamily: fontFamily)),
                ),
              ),
            ),
          ),
          /* ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  itemScrollController.scrollTo(
                      index: 2,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOutCubic);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Santiago Cocina",
                      style: TextStyle(
                          fontSize: 16,
                          color: navLinkColor,
                          fontFamily: fontFamily)),
                ),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  itemScrollController.scrollTo(
                      index: 3,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOutCubic);
                },
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Digital Menu",
                        style: TextStyle(
                            fontSize: 16,
                            color: navLinkColor,
                            fontFamily: fontFamily))),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  itemScrollController.scrollTo(
                      index: 4,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOutCubic);
                },
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Cosmere",
                        style: TextStyle(
                            fontSize: 16,
                            color: navLinkColor,
                            fontFamily: fontFamily))),
              ),
            ),
          ), */
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  itemScrollController.scrollTo(
                      index: 5,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOutCubic);
                },
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Sobre Nosotros",
                        style: TextStyle(
                            fontSize: 16,
                            color: navLinkColor,
                            fontFamily: fontFamily))),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => openUrl('https://www.instagram.com/dinamica.com.ar'),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ImageIcon(AssetImage("assets/images/instagram.png"),
                    color: navLinkColor, size: 24),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => openUrl('https://www.facebook.com/tarjetadinamica'),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ImageIcon(AssetImage("assets/images/facebook.png"),
                    color: navLinkColor, size: 24),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: TABLET)],
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 0),
              child: TextButton(
                onPressed: () {
                  itemScrollController.scrollTo(
                      index: 6,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOutCubic);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(primary),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return buttonPrimaryDark;
                        }
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return buttonPrimaryDarkPressed;
                        }
                        return primary;
                      },
                    ),
                    // Shape sets the border radius from default 3 to 0.
                    shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)));
                        }
                        return const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)));
                      },
                    ),
                    // Side adds pressed highlight outline.
                    side: MaterialStateProperty.resolveWith<BorderSide>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return const BorderSide(
                            width: 3, color: buttonPrimaryPressedOutline);
                      }
                      // Transparent border placeholder as Flutter does not allow
                      // negative margins.
                      return const BorderSide(width: 0, color: Colors.white);
                    })),
                child: Text(
                  "Contactanos",
                  style: buttonTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
