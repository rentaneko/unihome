import 'package:flutter/material.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/styles/color.dart';
import 'package:unihome/utils/metric.dart';
import 'package:unihome/utils/widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/logos/logo.png'),
            SizedBox(height: responsiveHeight(30)),
            Center(
              child: Text(
                'VINFLAT',
                style: TextStyle(
                  fontSize: responsiveFont(22),
                  color: AppColor.primary,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SF Pro Display',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(responsiveWidth(8)),
              child: Text(
                'Đăng nhập vào tài khoản Vinflat của bạn để có một cuộc sống đầy tiện nghi nhất!',
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w300,
                  color: AppColor.grayText,
                  fontSize: responsiveFont(14),
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(12)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
              child: button(
                'Đăng nhập cho người thuê',
                () => goTo(screen: ROUTE_LOGIN),
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
              child: button(
                'Đăng nhập cho nhân viên',
                () => goTo(screen: ROUTE_LOGIN_TECH),
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
          ],
        ),
      ),
    );
  }
}
