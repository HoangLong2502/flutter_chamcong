import 'package:flutter/material.dart';

class HistoryAction extends StatelessWidget {
  final List _listHistory = [
    {'title': 'Lịch sử chấm công'},
    {'title': 'Thống kê công việc'},
    {'title': 'Chi tiết bảng lương'}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        children: _listHistory.map((e) {
          return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_alarm),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        '${e['title']}',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_outlined, size: 16,)
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
