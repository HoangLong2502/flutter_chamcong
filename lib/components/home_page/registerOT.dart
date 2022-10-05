import 'package:flutter/material.dart';

const List _userAssigne = ['Trần Thế Anh', 'Lê Bá Hoàng Long'];

class RegisterOT extends StatefulWidget {
  @override
  State<RegisterOT> createState() => _RegisterOTState();
}

class _RegisterOTState extends State<RegisterOT> {
  final List _listReason = [
    'Hoàn thành công việc trong dự án',
    'Hỗ trợ nhân sự phòng ban khác',
    'Công việc văn phòng',
    'Họp nội bộ',
    'Có lịch họp với khách hàng',
    'Lý do khác',
  ];

  String userAssignSelect = _userAssigne[1].toString();

  bool isChecked = false;

  TimeOfDay _timeNow = TimeOfDay.now();

  void _showTimePicker() async {
    showTimePicker(
      context: context,
      initialTime: _timeNow,
    ).then((value) {
      if (value != null) {
        setState(() {
          _timeNow = value;
        });
      } else {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Theme.of(context).primaryColor;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lý do đăng ký OT',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline5?.fontSize,
                  fontWeight: Theme.of(context).textTheme.headline5?.fontWeight,
                ),
              ),
              SizedBox(
                height: 8,
              ),

              // Reason OT
              Container(
                child: Column(
                  children: _listReason.map((e) {
                    return Card(
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD9DCE0)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              checkColor: Colors.white,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Container(
                              child: Text(
                                '${e}',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 16,
              ),

              // Time OT
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thời gian OT',
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
                        _showTimePicker();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_timeNow.hour}:${_timeNow.minute}',
                            style: TextStyle(color: Color(0xFF303439)),
                          ),
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
              ),
              SizedBox(
                height: 16,
              ),

              //User Assigne
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Người kiểm duyệt',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: 4),
                  Card(
                    child: DropdownButtonFormField(
                      value: userAssignSelect,
                      items: _userAssigne.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: ((String? value) {
                        setState(
                          () {
                            userAssignSelect = value!;
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
              ),
              SizedBox(height: 24),

              //
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Đóng',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Hoàn thành',
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.headline3?.fontSize,
                            fontWeight: Theme.of(context).textTheme.headline3?.fontWeight,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
