import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUs extends StatelessWidget {
  static String routeName = '/about-us';
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
              leading: const Text('关于',
                style: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w600
                ),),
              trailing: SvgPicture.asset('assets/icons/svg/info.svg')
            // Icon(Icons.info, color: Colors.black, size: 32,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Center(child: Column(
              children: [
                const Text('木风',style: const TextStyle(fontFamily: 'Lexend',
                    fontSize: 48,
                    fontWeight: FontWeight.w700
                ),),
                const Text('智能空调（家居）APP',style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff9B9B9B)
                ),),
                const SizedBox(height: 11,),
                const Text('Version: 1.0.1 (alpha)',style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w300
                ),),
              ],
            )),
          ),
          const SizedBox(height: 39,),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 33.7,right: 10),
            leading: SvgPicture.asset('assets/icons/svg/profile.svg'),
            title: const Text('开发者',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
                fontSize: 20,
              ),
            ),
            subtitle: const Text('长街听枫',
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w300
              ),),
            onTap: (){},
          ),
          const SizedBox(height: 12,),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 33.7,right: 10),
            leading: SvgPicture.asset('assets/icons/svg/team.svg'),
            title: const Text('所属单位',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
                fontSize: 20,
              ),
            ),
            subtitle: const Text('中南大学计算机学院',
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Lexend',
              ),),
            onTap: (){},
          ),
          // const SizedBox(height: 12,),
          // ListTile(
          //   contentPadding: const EdgeInsets.only(left: 33.7,right: 10),
          //   leading: SvgPicture.asset('assets/icons/svg/star.svg',),
          //   title: const Text('Acknowledgement',
          //     style: const TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontFamily: 'Lexend',
          //       fontSize: 20,
          //     ),
          //   ),
          //
          //   subtitle: const Text('People and open source projects that helped the development of Domus',
          //     style: const TextStyle(
          //       fontSize: 14,
          //       fontFamily: 'Lexend',
          //     ),),
          //   onTap: (){},
          // ),
          const SizedBox(height: 12,),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 33.7,right: 10),
            leading: SvgPicture.asset('assets/icons/svg/help.svg'),
            title: const Text('帮助',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
                fontSize: 20,
              ),
            ),
            subtitle: const Text('用户引导手册',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Lexend',
              ),),
            onTap: (){},
          ),
          const SizedBox(height: 12,),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 33.7,right: 10),
            leading: SvgPicture.asset('assets/icons/svg/chat.svg'),
            title: const Text('联系我们',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
                fontSize: 20,
              ),
            ),
            subtitle: const Text('3867*****@qq.com',
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Lexend',
              ),),
            onTap: (){},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Made with ',style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w300
                ),),
                SvgPicture.asset('assets/icons/svg/heart.svg'),
                const Text(' in IN',style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w300
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}