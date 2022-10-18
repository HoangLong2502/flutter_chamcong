import 'package:chamcong_app/providers/auth.dart';
import 'package:chamcong_app/providers/users.dart';
import 'package:chamcong_app/widgets/time_break/time_of_set_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TimeBreakScreen extends StatefulWidget {
  static String routeName = '/timebreakscreen';
  @override
  State<TimeBreakScreen> createState() => _TimeBreakScreenState();
}

const List _listCategorybreak = [
  'Xin nghỉ phép',
  'Xin nghỉ đột xuất',
  'Xin đến muộn',
  'Xin về sớm',
];

const List _listCausebreak = [
  'Sức khỏe',
  'Việc gia đình',
  'Việc cá nhân',
  'Việc phát sinh đột xuất',
];

class _TimeBreakScreenState extends State<TimeBreakScreen> {
  String categorybreak = _listCategorybreak[0].toString();
  String causebreak = _listCausebreak[0];
  DateTime time_start = DateTime.now();
  DateTime time_end = DateTime.now();
  late int user;
  late List timeoffset_many;
  String user_accept = '1';

  // List user assign
  List users = [];

  // List timeoffset
  List<Map<String, dynamic>> dataTimeoffset = [
    {
      'delete' : false,
      'day': DateTime.now(),
      'time_start': TimeOfDay(hour: 0, minute: 0),
      'time_end': TimeOfDay(hour: 0, minute: 0),
    }
  ];

  bool _isInit = true;

  // function delete time off set item
  void deleteTimeOffSetItem(Map<String, dynamic> item) {
    setState(() {
      dataTimeoffset.remove(item);
    });
  }

  void changeDateTimeOffSet(item, newValue) {
    setState(() {
      item['day'] = newValue;
    });
  }

  void changeTimeStart(item,typeTime, newValue) {
    setState(() {
      item[typeTime] = newValue;
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        user = Provider.of<Auth>(context).getAccount['id'];
      });
      Provider.of<Users>(context).getAllAccount().then((value) {
        setState(() {
          users = value;
        });
      });
    }
    setState(() {
      _isInit = false;
    });
    super.didChangeDependencies();
  }

  // build Container
  Widget buildContainer(BuildContext context, String title, Widget child) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '*',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          child,
        ],
      ),
    );
  }

  // build Select
  Widget buildSelect(BuildContext context, String label, String valueSelect,
      List listOptions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(height: 4),
        Card(
          elevation: 0,
          child: DropdownButtonFormField(
            value: valueSelect,
            items: listOptions.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: ((String? value) {
              setState(
                () {
                  valueSelect = value!;
                },
              );
            }),
            hint: Container(
              child: Text(
                "Select Item Type",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.end,
              ),
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFD9DCE0),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFD9DCE0),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFD9DCE0),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

  // build TimePicker
  Widget buildTimePicker(
      BuildContext context, String label, String typeTime, Widget timeShow) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 8,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              DatePicker.showDateTimePicker(context,
                  showTitleActions: true,
                  minTime: DateTime.now(),
                  maxTime: DateTime(2030, 6, 7), onConfirm: (date) {
                setState(() {
                  typeTime == 'time_start'
                      ? time_start = date
                      : time_end = date;
                });
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                timeShow,
                Icon(
                  Icons.calendar_month_outlined,
                  color: Color(0xFF303439),
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo đơn xin nghỉ'),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(right: 16, left: 16, bottom: 116, top: 16),
          child: Column(
            children: [
              buildContainer(
                context,
                'Thông tin đơn xin nghỉ',
                Column(
                  children: [
                    buildSelect(context, 'Loại đơn xin nghỉ', categorybreak,
                        _listCategorybreak),
                    SizedBox(height: 8),
                    buildSelect(
                        context, 'Lý do làm đơn', causebreak, _listCausebreak),
                    SizedBox(height: 8),
                    buildTimePicker(
                      context,
                      'Thời gian bắt đầu',
                      'time_start',
                      Text(
                        DateFormat.yMd().format(time_start) +
                            ' - ' +
                            DateFormat.Hms().format(time_start),
                        style: TextStyle(color: Color(0xFF303439)),
                      ),
                    ),
                    SizedBox(height: 8),
                    buildTimePicker(
                      context,
                      'Thời gian kết thúc',
                      'time_end',
                      Text(
                        DateFormat.yMd().format(time_end) +
                            ' - ' +
                            DateFormat.Hms().format(time_end),
                        style: TextStyle(color: Color(0xFF303439)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              buildContainer(
                context,
                'Bàn giao công việc',
                Column(
                  children: [],
                ),
              ),
              SizedBox(height: 16),
              buildContainer(
                context,
                'Thời gian làm bù',
                Column(
                  children: [
                    Wrap(
                      runSpacing: 16,
                      children: dataTimeoffset
                          .map(
                            (item) => TimeOfSetItem(
                              item,
                              IconButton(
                                onPressed: () {
                                  deleteTimeOffSetItem(item);
                                },
                                icon: Icon(Icons.delete_outlined, size: 22),
                              ),
                              changeDateTimeOffSet,
                              changeTimeStart,
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 16),

                    // add more Time off set
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          dataTimeoffset.add({
                            'delete' : true,
                            'day': DateTime.now(),
                            'time_start': TimeOfDay(hour: 0, minute: 0),
                            'time_end': TimeOfDay(hour: 0, minute: 0),
                          });
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_outline_sharp,
                            size: 22,
                          ),
                          SizedBox(width: 4),
                          Text('Thêm thời gian')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              buildContainer(
                context,
                'Kiểm duyệt',
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Người kiểm duyệt',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: 4),
                    Card(
                      elevation: 0,
                      child: DropdownButtonFormField(
                        menuMaxHeight: 300,
                        value: user_accept,
                        items: users.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['id'].toString(),
                            child: Text(item['full_name']),
                          );
                        }).toList(),
                        onChanged: ((String? value) {
                          setState(
                            () {
                              user_accept = value!;
                            },
                          );
                        }),
                        hint: Container(
                          child: Text(
                            "Chọn người kiểm duyệt",
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9DCE0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9DCE0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9DCE0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        color: Colors.white,
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Hủy bỏ',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {},
              child: Text(
                'Hoàn thành',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  fontWeight: Theme.of(context).textTheme.headline2!.fontWeight,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
