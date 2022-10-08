import 'package:chamcong_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFEF4923),
        backgroundColor: Color(0xFFF2F3F8),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF303439)),
          headline3: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          headline5: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          headline6: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ).apply(bodyColor: Color(0xFF303439)),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Color(0xFF303439),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF74777A),
          size: 28,
        ),
      ),
      routes: {
        '/' :(context) => TabsScreen(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).backgroundColor,
//       appBar: AppBar(
//         elevation: 4,
//         backgroundColor: Colors.white,
//         title: Row(
//           children: [
//             Icon(
//               Icons.location_pin,
//               color: Theme.of(context).primaryColor,
//             ),
//             Text(
//               '48 Tố Hữu, Trung Văn, Từ Liêm, Hà Nội',
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             HomeAction(),
//             HistoryAction(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         elevation: 5,
//         child: Container(
//           padding: EdgeInsets.all(16),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Icon(Icons.home),
//               Icon(
//                 Icons.calendar_month,
//                 color: Theme.of(context).primaryColor,
//               ),
//               Icon(Icons.camera),
//               Icon(Icons.notifications),
//               Icon(Icons.info),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
