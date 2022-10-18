import 'package:chamcong_app/providers/api.dart';
import 'package:chamcong_app/providers/auth.dart';
import 'package:chamcong_app/providers/location.dart';
import 'package:chamcong_app/providers/time_break.dart';
import 'package:chamcong_app/providers/time_ot.dart';
import 'package:chamcong_app/providers/time_work.dart';
import 'package:chamcong_app/providers/users.dart';
import 'package:chamcong_app/screens/auth_screen.dart';
import 'package:chamcong_app/screens/history_timework_screen.dart';
import 'package:chamcong_app/screens/tabs_screen.dart';
import 'package:chamcong_app/screens/timebreak_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Auth()),
          ChangeNotifierProvider(create: (context) => API()),
          ChangeNotifierProvider(create: (context) => Location()),
          ChangeNotifierProvider(create: (context) => TimeWork()),

          // State Users
          ChangeNotifierProxyProvider<Auth, Users>(
            create: (_) => Users('', '', {}),
            update: (context, auth, users) =>
                Users(auth.token, auth.apiAllAccount, auth.getHeader()),
          ),

          //State TimeBreak
          ChangeNotifierProxyProvider<Auth, TimeBreaks>(
            create: (_) => TimeBreaks('', '', {}),
            update: (context, auth, users) =>
                TimeBreaks(auth.token, auth.apiTimebreak, auth.getHeader()),
          ),

          //State Time OT
          ChangeNotifierProxyProvider<Auth, TimeOT>(
            create: (_) => TimeOT('', '', {}),
            update: (context, auth, timeOt) =>
                TimeOT(auth.token, auth.apiTimeOT, auth.getHeader()),
          )
        ],
        child: Consumer<Auth>(
          builder: (context, auth, child) {
            return MaterialApp(
              theme: ThemeData(
                primaryColor: Color(0xFFEF4923),
                backgroundColor: Color(0xFFF2F3F8),
                inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFD9DDE8)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                textTheme: TextTheme(
                  headline1: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1a1a1a)),
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
                  elevation: 4,
                  backgroundColor: Colors.white,
                  iconTheme: Theme.of(context).iconTheme,
                  titleTextStyle: TextStyle(
                    color: Color(0xFF303439),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                iconTheme: IconThemeData(
                  color: Color(0xFF74777A),
                  size: 28,
                ),
              ),
              home: !auth.isAuth ? AuthScreen() : TabsScreen(),
              routes: {
                '/home': (context) => TabsScreen(),
                TimeBreakScreen.routeName: (context) => TimeBreakScreen(),
                HistoryTimeworkScreen.routeName:(context) => HistoryTimeworkScreen(),
              },
            );
          },
        ));
  }
}
