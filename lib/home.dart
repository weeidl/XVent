import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xvent/services/auth.dart';
import 'package:xvent/theme/colors.dart';
import 'package:xvent/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();

  final Auth _auth = Auth();
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
                  SvgPicture.asset(
                    'assets/logo_xvent.svg',
                    width: 124,
                    height: 26,
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
                        'Махачкала',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  text: '+',
                  onPressed: () {
                    setState(() {});
                    _controller.animateToSelection();
                  },
                ),
                SizedBox(width: 20),
                Button(
                  text: 'Exit',
                  onPressed: () async {
                    await _auth.singOut().then((result) {
                      Navigator.of(context).pop(true);
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          child: ListTile(
                            title: Text('$index'),
                            subtitle: Text('20'),
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
