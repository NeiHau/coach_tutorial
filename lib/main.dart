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
        if (shouldCoach) ModalBarrier(color: Colors.grey.withOpacity(0.3)),
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
            child: Column(
              children: [
                Stack(
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
                Container(
                  margin: EdgeInsets.only(left: 30.w),
                  width: 100.w,
                  height: 100.h,
                  child: Text(
                    "これは数字の１です！\nここをタップすると次の数字の説明に以降します。",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.red,
                    ),
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
            child: Column(
              children: [
                Stack(
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
                Container(
                  margin: EdgeInsets.only(right: 30.w),
                  width: 100.w,
                  height: 100.h,
                  child: Text(
                    "これは数字の２です！\nここをタップすると次の数字の説明に以降します。",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      case 3:
        return Container(
          padding: EdgeInsets.only(right: 130.w, top: 425.h),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Column(
                children: [
                  // テキストを先に配置し、マージンで位置を調整
                  Container(
                    padding: EdgeInsets.only(left: 55.w, top: 30.h),
                    margin: EdgeInsets.only(left: 50.w), // 右斜め上に配置するためにマージンを調整
                    child: Text(
                      "これは数字の３です！\nここをタップすると次の数字の説明に以降します。",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  // 円を配置
                  Container(
                    margin: EdgeInsets.only(right: 105.w),
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
            ],
          ),
        );
      case 4:
        return Container(
          padding: EdgeInsets.only(left: 140.w, top: 415.h),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 81.w, top: 30.h),
                    margin: EdgeInsets.only(left: 50.w), // 右斜め上に配置するためにマージンを調整
                    child: Text(
                      "これは数字の４です！\nここをタップするとチュートリアルを終了します。",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 105.w),
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
            ],
          ),
        );
      default:
        return Container();
    }
  }
}
