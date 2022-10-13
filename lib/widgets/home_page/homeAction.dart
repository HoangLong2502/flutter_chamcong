import 'package:chamcong_app/widgets/home_page/registerOT.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:chamcong_app/providers/auth.dart';
import 'package:provider/provider.dart';

class HomeAction extends StatelessWidget {
  final DateTime dateTime = DateTime.now();

  // void showDialogRegister () {
  //   showDialog(context: context, builder: (_) {
      
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final dataAccount = Provider.of<Auth>(context).getAccount;
    print(dataAccount);
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xFFD9DCE0)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        width: 48,
                        height: 48,
                        child: Image.asset(
                          'assets/images/imgUserDefault.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataAccount['full_name'],
                              style: TextStyle(fontSize: Theme.of(context).textTheme.headline2?.fontSize, fontWeight: Theme.of(context).textTheme.headline2?.fontWeight, color: Color(0xFF2577C9),),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'NVIDT123456789',
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // Date
                Container(
                  padding: EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${DateFormat.E().format(dateTime)} ,${DateFormat.yMd().format(dateTime)}',
                        style: TextStyle(
                          fontWeight:
                              Theme.of(context).textTheme.headline1?.fontWeight,
                          fontSize:
                              Theme.of(context).textTheme.headline1?.fontSize,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Hãy chấm công vì chén cơm của bạn',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight:
                              Theme.of(context).textTheme.headline3?.fontWeight,
                          fontSize:
                              Theme.of(context).textTheme.headline3?.fontSize,
                        ),
                      ),
                    ],
                  ),
                ),

                //Checkin/checkout
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 16,
                                bottom: 16,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFD9DCE0),
                                    ),
                                    right: BorderSide(
                                      color: Color(0xFFD9DCE0),
                                    )),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.login,
                                    color: Color(0xFF1AB65C),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Check-in',
                                    style: TextStyle(
                                      color: Color(0xFF1AB65C),
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.fontSize,
                                      fontWeight: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.fontWeight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 16,
                                bottom: 16,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFD9DCE0),
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: Color(0xFFD92B6A),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Check-out',
                                    style: TextStyle(
                                      color: Color(0xFFD92B6A),
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.fontSize,
                                      fontWeight: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.fontWeight,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 16,
                                bottom: 16,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                      color: Color(0xFFD9DCE0),
                                    )),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  showDialog(context: context, builder: (_) {
                                    return RegisterOT();
                                  });
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.edit_calendar_sharp,
                                      color: Color(0xFF2577C9),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Đăng ký OT',
                                      style: TextStyle(
                                        color: Color(0xFF2577C9),
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .headline2
                                            ?.fontSize,
                                        fontWeight: Theme.of(context)
                                            .textTheme
                                            .headline2
                                            ?.fontWeight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 16,
                                bottom: 16,
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.sick,
                                    color: Color(0xFF303439),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Xin nghỉ',
                                    style: TextStyle(
                                      color: Color(0xFF303439),
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.fontSize,
                                      fontWeight: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.fontWeight,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
