import 'package:flutter/material.dart';
import 'package:flutter_website/components/colors.dart';
import 'package:flutter_website/components/icons.dart';
import 'package:flutter_website/components/spacing.dart';
import 'package:flutter_website/components/typography.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Features extends StatelessWidget {
  const Features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        columnMainAxisSize: MainAxisSize.min,
        rowPadding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
        columnPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        columnSpacing: 50,
        rowSpacing: 50,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: buildMaterialIconCircle(
                      "assets/images/icon_development.png", 250),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Desarrollo Ágil",
                      style: headlineSecondaryTextStyle,
                      textAlign: TextAlign.center),
                ),
                const Text("Claro Pay, tu billetera.tu billetera.",
                    style: bodyTextStyle, textAlign: TextAlign.center),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child:
                      buildMaterialIconCircle("assets/images/icon_ui.png", 250),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Desarrollo Multiplataforma",
                      style: headlineSecondaryTextStyle,
                      textAlign: TextAlign.center),
                ),
                const Text(
                    "Desarrollamos nuestras aplicaciones tanto de iOS como Android de forma nativa y como si fuera poco, agregamos  tanto aplicaciones de escritorio y desarrollo de sistemas Web , logrando de esta manera productos finales confiables y de alta performance en su funcionamiento.",
                    style: bodyTextStyle,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: buildMaterialIconCircle(
                      "assets/images/icon_performance.png", 250),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Comunicación y Soporte",
                      style: headlineSecondaryTextStyle,
                      textAlign: TextAlign.center),
                ),
                RichText(
                  text: const TextSpan(
                    style: bodyTextStyle,
                    children: [
                      TextSpan(
                          text:
                              "Mantenemos una relación cercana con nuestros clientes durante el proceso de desarrollo, que continúa posterior a la implementación de la solución. Estamos a disposición del cliente para resolver cualquier falla o situación que se presente de forma inmediata."),
                    ],
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
