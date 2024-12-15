import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:r_nav_n_sheet/r_nav_n_sheet.dart';
import 'package:remixicon/remixicon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    var white = Colors.white;
    var iconTheme = IconThemeData(color: white);
    var bgColor = const Color(0xff282c38);
    var bgColorLight = const Color(0xff232732);
    var accent = Colors.pink;
    var error = Colors.red;

    return MaterialApp(
      theme: flutterNesTheme(),
      title: 'RNavNSheet',
      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData(
      //   scaffoldBackgroundColor: bgColor,
      //   cardColor: white,
      //   canvasColor: bgColor,
      //   fontFamily: GoogleFonts.montserrat().fontFamily,
      //   appBarTheme: AppBarTheme(
      //     iconTheme: iconTheme,
      //     backgroundColor: bgColorLight,
      //     elevation: 0.0,
      //   ),
      //   iconTheme: iconTheme,
      //   colorScheme: ColorScheme(
      //     brightness: Brightness.dark,
      //     primary: accent,
      //     onPrimary: white,
      //     secondary: accent,
      //     onSecondary: white,
      //     error: error,
      //     onError: white,
      //     surface: white,
      //     onSurface: white,
      //   ),
      // ),
      // themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("RNavNSheet"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Remix.notification_2_fill),
            onPressed: () {},
          ),
        ],
      ),
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              [
                Remix.home_6_fill,
                Remix.search_2_fill,
                Remix.shopping_cart_2_fill,
                Remix.user_3_fill
              ][_index],
              color: theme.colorScheme.secondary,
              size: 48,
            ),
            const SizedBox(height: 10),
            Text(
              ["Home", "Search", "Cart", "Account"][_index],
              textScaleFactor: 2.0,
              style: TextStyle(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RNavNSheet(
        onTap: (index) {
          setState(() {
            _index = index;
          });
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _index = index;
            });
          });
        },
        initialSelectedIndex: _index,
        sheet: Sheet(),
        sheetOpenIcon: IconItem.iconItem(NesIcons.add),
        sheetCloseIcon: IconItem.iconItem(NesIcons.close),
        sheetCloseIconBoxColor: Colors.white,
        sheetCloseIconColor: theme.scaffoldBackgroundColor,
        sheetOpenIconColor: Colors.white,
        onSheetToggle: (v) {
          setState(() {});
        },
        items:  [
          RNavItem(
            activeIcon: IconItem.iconItem(NesIcons.sun),
            icon: IconItem.iconItem(NesIcons.sun),
            label: "Home",
          ),
          RNavItem(
            icon: IconItem.iconItem(NesIcons.sun),
            activeIcon: IconItem.iconItem(NesIcons.sun),
            label: "Search",
          ),
          RNavItem(
            icon:IconItem.iconItem(NesIcons.sun),
            activeIcon: IconItem.iconItem(NesIcons.sun),
            label: "Cart",
          ),
          RNavItem(
            icon: IconItem.iconItem(NesIcons.sun),
            activeIcon: IconItem.iconItem(NesIcons.sun),
            label: "Account",
          ),
        ],
      ),
    );
  }
}

class Sheet extends StatelessWidget {
  Sheet({super.key});

  final icons = [
    {
      "i": Remix.bookmark_2_line,
      "t": "Orders",
      "s": "5 pending orders",
      "c": Colors.indigo,
    },
    {
      "i": Remix.bank_card_2_line,
      "t": "Payments",
      "s": "No pending payments",
      "c": Colors.purple,
    },
    {
      "i": Remix.map_pin_line,
      "t": "Addresses",
      "s": "No pending payments",
      "c": Colors.green,
    },
    {
      "i": Remix.heart_2_line,
      "t": "Wishlist",
      "s": "No pending payments",
      "c": Colors.red,
    },
    {
      "i": Remix.refund_line,
      "t": "Buy again",
      "s": "No pending payments",
      "c": Colors.cyan,
    },
  ];

  final icons2 = [
    {
      "i": Remix.settings_5_line,
      "t": "Settings",
      "s": "Theme, color, etc.",
      "c": Colors.blueGrey,
    },
    {
      "i": Remix.question_answer_line,
      "t": "Help & Support",
      "s": "Chat with us",
      "c": Colors.deepOrange,
    },
    {
      "i": Remix.information_line,
      "t": "About",
      "s": "Know more about us",
      "c": Colors.indigo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return DraggableScrollableSheet(
      builder: (context, controller) {
        return Material(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                height: 8,
                width: 40,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          for (var icon in icons)
                            FractionallySizedBox(
                              widthFactor: 0.33,
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        (icon["c"] as Color).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10)),
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Icon(
                                      (icon["i"] as IconData),
                                      color: icon["c"] as Color,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "${icon["t"]}",
                                      overflow: TextOverflow.ellipsis,
                                      textScaler: const TextScaler.linear(0.9),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "More options".toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                      Wrap(
                        children: [
                          for (var icon in icons2) ...[
                            if (icons2.indexOf(icon) > 0)
                              const Divider(
                                color: Colors.black26,
                                height: 1,
                                indent: 48,
                              ),
                            ListTile(
                              leading: Icon(
                                (icon["i"] as IconData),
                                color: icon["c"] as Color,
                              ),
                              minLeadingWidth: 0,
                              minVerticalPadding: 20,
                              title: Text(
                                "${icon["t"]}",
                                style: const TextStyle(color: Colors.black),
                              ),
                              dense: true,
                              visualDensity: VisualDensity.compact,
                              subtitle: Text(
                                "${icon["s"]}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.black54),
                              ),
                            ),
                          ]
                        ],
                      ),
                      const SizedBox(height: 72),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      minChildSize: 0.5,
      initialChildSize: 0.75,
    );
  }
}
