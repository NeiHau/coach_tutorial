import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'チュートリアル画面'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _coachIndex = 1;

  bool shouldCoach = true;

  @override
  void initState() {
    super.initState();
    _coachIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: _bodyWidget(),
        ),
        if (shouldCoach)
          SafeArea(
            child: _buildCoachWidget(),
          ),
        GestureDetector(
          onTap: () {
            if (_coachIndex < 5) {
              setState(() {
                _coachIndex += 1;
              });
            }

            if (_coachIndex == 5) {
              setState(() {
                shouldCoach = false;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 63.w, top: 60.h),
              child: Text(
                "1",
                style: TextStyle(fontSize: 24.sp),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 57.w, top: 64.h),
              child: Text(
                "2",
                style: TextStyle(fontSize: 24.sp),
              ),
            ),
          ],
        ),
        Gap(330.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 63.w, top: 60.h),
              child: Text(
                "3",
                style: TextStyle(fontSize: 24.sp),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 57.w, top: 64.h),
              child: Text(
                "4",
                style: TextStyle(fontSize: 24.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCoachWidget() {
    switch (_coachIndex) {
      case 1:
        return Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.only(left: 3.w, top: 58.h),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.w),
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.transparent, // 内部を透明に設定
                    border: Border.all(
                      color: Colors.red, // 境界線の色を設定
                      width: 5.w, // 境界線の幅を設定
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        );
      case 2:
        return Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: EdgeInsets.only(top: 59.h),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.w),
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.blue,
                      width: 5.w,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        );
      case 3:
        return Container(
          padding: EdgeInsets.only(left: 5.w, top: 485.h),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15.w),
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.green,
                    width: 5.w,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        );
      case 4:
        return Container(
          padding: EdgeInsets.only(left: 245.w, top: 488.h),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15.w),
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.purple,
                    width: 5.w,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }
}
