import 'package:dinamica_pay/ui/block_wrapper.dart';
import 'package:dinamica_pay/ui/footer.dart';
import 'package:dinamica_pay/ui/home.dart';
import 'package:dinamica_pay/ui/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'components/components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemScrollController itemScrollController = ItemScrollController();
    final ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();

    return MaterialApp(
        title: 'Dinamica Pay',
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            defaultScale: true,
            minWidth: 480,
            defaultName: MOBILE,
            breakpoints: [
              const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
              const ResponsiveBreakpoint.resize(600, name: MOBILE),
              const ResponsiveBreakpoint.resize(850, name: TABLET),
              const ResponsiveBreakpoint.resize(1080, name: DESKTOP),
            ],
            background: Container(color: background)),
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 66),
              child: Material(
                  elevation: 4,
                  child: MenuBar(
                    itemScrollController: itemScrollController,
                  ))),
          body: ScrollablePositionedList.builder(
              itemScrollController: itemScrollController,
              itemPositionsListener: itemPositionsListener,
              itemCount: blocks.length,
              itemBuilder: (context, index) {
                return blocks[index];
              }),
        ));
  }
}

List<Widget> blocks = const [
  BlockWrapper(Home()),
  Footer(),
];
