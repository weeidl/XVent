import 'package:custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xvent/services/auth.dart';
import 'package:xvent/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();

  final AuthServer _auth = AuthServer();

  void customBottomSheet(BuildContext context) {
    SlideDialog.showSlideDialog(
      context: context,
      backgroundColor: Colors.white,
      pillColor: Colors.yellow,
      transitionDuration: Duration(milliseconds: 300),
      child: Text('Your code'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XVentColor.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48, bottom: 32),
              child: Row(
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      'assets/logo_xvent.svg',
                      width: 124,
                      height: 26,
                    ),
                    onTap: () async {
                      await _auth.singOut();
                    },
                  ),
                  Spacer(),
                  Icon(
                    Icons.notifications,
                    size: 24,
                    color: XVentColor.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Привет, Артур',
                        style: TextStyle(
                          color: XVentColor.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Казань',
                        style: TextStyle(color: XVentColor.white, fontSize: 18),
                      ),
                    ],
                  ),
                  // Icon(
                  //   Icons.notifications,
                  //   size: 24,
                  //   color: XVentColor.white,
                  // ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: XVentColor.yellow,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  monthTextStyle: TextStyle(color: XVentColor.white),
                  dateTextStyle: TextStyle(color: XVentColor.white),
                  dayTextStyle: TextStyle(color: XVentColor.white),
                  selectionColor: XVentColor.yellow,
                  selectedTextColor: XVentColor.black,
                  deactivatedColor: XVentColor.black,
                  controller: _controller,
                  locale: 'ru_RU',
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                      print(_selectedValue);
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  'Категории',
                  style: TextStyle(color: XVentColor.white, fontSize: 18),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    customBottomSheet(context);
                  },
                  child: Text(
                    'Показать все',
                    style: TextStyle(color: XVentColor.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Card(
                        color: XVentColor.yellow,
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          child: ListTile(
                            title: Text('WEEIDL $index'),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
