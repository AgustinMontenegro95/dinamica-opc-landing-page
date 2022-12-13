import 'package:dinamica_pay/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/components.dart';

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
      decoration: const BoxDecoration(color: primary),
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
                child: Image.asset("assets/images/dinamica/dinamica.png",
                    height: 60, fit: BoxFit.contain),
              ),
            ),
          ),
          const Spacer(),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => openUrl('https://www.instagram.com/dinamica.com.ar'),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ImageIcon(
                    AssetImage("assets/images/social-media/instagram.png"),
                    color: navLinkColor,
                    size: 24),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => openUrl('https://www.facebook.com/tarjetadinamica'),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ImageIcon(
                    AssetImage("assets/images/social-media/facebook.png"),
                    color: navLinkColor,
                    size: 24),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: TABLET)],
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 0),
              child: TextButton(
                onPressed: () async {
                  kIsWeb ? contactUs(context) : callMe(number: "+54385117816");
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
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
                        return BorderSide(
                            width: 3, color: buttonPrimaryPressedOutline);
                      }
                      // Transparent border placeholder as Flutter does not allow
                      // negative margins.
                      return const BorderSide(width: 0, color: Colors.grey);
                    })),
                child: Text(
                  "Contactanos",
                  style: buttonTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  callMe({required String number}) async {
    final Uri url = Uri(scheme: 'tel', path: number);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  contactUs(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        child: AlertDialog(
          title: Center(
            child: Image.asset(
              "assets/images/dinamica/dinamica-height-red.png",
              height: 50,
            ),
          ),
          content: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Contactanos:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                Row(
                  children: [
                    const Text("Via e-mail: "),
                    TextButton(
                      onPressed: () async {
                        final Uri uri =
                            Uri.parse('mailto:info@midinamica.com.ar?'
                                'subject=Contacto'
                                '&'
                                'body=Insertar consulta aqui.');
                        if (!await launchUrl(uri)) {
                          throw 'Could not launch $uri';
                        }
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.focused)) {
                            return Colors.red;
                          }
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.transparent;
                          }
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.red;
                          }
                          return Colors.black; // Defer to the widget's default.
                        }),
                      ),
                      child: const Text("info@midinamica.com.ar"),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text("Via teléfono: "),
                    SelectableText("0810 555 2403"),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("ACEPTAR"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  textStyle: const TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
