import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryTimeworkScreen extends StatefulWidget {
  static const routeName = '/history_timework';

  @override
  State<HistoryTimeworkScreen> createState() => _HistoryTimeworkScreenState();
}

class _HistoryTimeworkScreenState extends State<HistoryTimeworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử chấm công'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tháng ${DateFormat.M().format(DateTime.now())}',
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.headline1!.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.headline1!.fontWeight,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '15',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .fontWeight,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            '/25',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .fontWeight,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ngày ${DateFormat.d().format(DateTime.now())}, ${DateFormat.y().format(DateTime.now())}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Ngày công',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
