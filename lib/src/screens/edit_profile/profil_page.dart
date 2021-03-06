import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:maple/src/screens/devices_screen/device_total/components/mytheme.dart';
import 'package:maple/src/screens/statistic_screen/secondary/HelpPage.dart';
import 'package:maple/src/screens/statistic_screen/secondary/PageNotFound.dart';
import 'package:maple/src/screens/statistic_screen/secondary/privacy_policy.dart';
import 'package:maple/src/screens/statistic_screen/components/main_themes.dart';
import 'package:maple/src/widgets/card.dart';
import 'package:maple/utils/shared_preferences_util.dart';
import 'package:transparent_image/transparent_image.dart';

class ProfileLandingScreen extends StatefulWidget {
  const ProfileLandingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileLandingScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileLandingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xffF7F8FB),
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Center(
                    child: Column(
                      children: [
                        FutureBuilder<String?>(
                            future: SharedPreferencesUtil.getCache(SharedPreferencesUtil.HEAD_PIC),
                            builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                              if(snapshot.hasData){
                                return DottedBorder(
                                  borderType: BorderType.Circle,
                                  radius: Radius.circular(35),
                                  color: MyTheme.indigo,
                                  child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,

                                  ),
                                  child: ClipRRect(
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: snapshot.data??"",
                                      fit: BoxFit.cover,

                                    ),
                                    borderRadius: BorderRadius.circular(35),
                                  ),),);
                              } else {
                                return  Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 15,
                                  ),
                                  child: CircularProgressIndicator(color: Colors.grey.shade300,),
                                );
                              }
                            }
                        ),
                        SizedBox(height: 16),
                        FutureBuilder<String?>(
                          future: SharedPreferencesUtil.getUserName(),
                          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                              if(snapshot.hasData){
                                return  Text(
                                  snapshot.data ?? " ",
                                  style: headerTextStyle.copyWith(fontSize: 18),
                                );
                              } else {
                                return  Text(
                                  "??????",
                                  style: headerTextStyle.copyWith(fontSize: 18),
                                );
                              }
                            }
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Wood-Wind User',
                          style: subHeaderCardTextStyle.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'General',
                    style: headerTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  CardSettingProfile(
                    imageUrl: 'assets/images/company/org.png',
                    title: '??????',
                    subtitle: '????????????/????????????????????????????????????????????????',
                    location: PageNotFound(),
                  ),
                  SizedBox(height: 16),
                  CardSettingProfile(
                    imageUrl: 'assets/images/company/lock.png',
                    title: '??????',
                    subtitle: '?????????????????????????????????',
                    location: PageNotFound(),
                  ),
                  SizedBox(height: 16),
                  CardSettingProfile(
                    imageUrl: 'assets/images/company/info_square.png',
                    title: '??????',
                    subtitle: '???????????????????',
                    location: HelpPage(),
                  ),
                  SizedBox(height: 16),
                  CardSettingProfile(
                    imageUrl: 'assets/images/company/setting.png',
                    title: '????????????',
                    subtitle: '???????????????????????????',
                    location: PrivacyPolicy(),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
