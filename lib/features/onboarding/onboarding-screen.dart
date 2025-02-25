import 'package:defifundr_mobile/core/constants/assets.dart';
import 'package:defifundr_mobile/core/constants/size.dart';
import 'package:defifundr_mobile/core/shared/buttons/primary_button.dart';
import 'package:defifundr_mobile/core/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      bgImage: AppAssets.onBoardingBg1,
      title: "Pay anyone, anywhere.",
      text: "Experience Fast, Secure Crypto & Fiat Payroll & Invoicing with Defifundr",
    ),
    OnboardModel(
        bgImage: AppAssets.onBoardingBg1,
        text: "Set up automated payroll schedules and let our system handle timely, secure payouts in fiat or crypto.",
        img: AppAssets.onBoardingFrame1,
        title: "Pay on Time, Every Time"),
    OnboardModel(
        bgImage: AppAssets.onBoardingBg2,
        text: "Smart contracts ensure tamper-proof payments, reducing disputes and ensuring full transparency.",
        img: AppAssets.onBoardingFrame2,
        title: "Secure & Transparent Transactions"),
    OnboardModel(
        bgImage: AppAssets.onBoardingBg2,
        text: "Get notified about salary payouts, invoice approvals, and compliance updates instantly.",
        img: AppAssets.onBoardingFrame3,
        title: "Instant Notifications & Compliance Alerts"),
  ];

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(currentIndex == 0 ? AppAssets.onBoardingBg1 : AppAssets.onBoardingBg2))),
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 5.0,
                child: ListView.builder(
                  itemCount: screens.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        width: context.screenWidth() / 4.35,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? currentIndex == 0
                                  ? AppColors.white100
                                  : Colors.black
                              : Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(currentIndex == 0 ? AppAssets.onBoardingLogoWhite : AppAssets.onBoardingLogo),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.white100.withOpacity(0.24)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "For Freelancers",
                            style: Config.h2(context).copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp, color: currentIndex == 0 ? AppColors.white100 : null),
                          ),
                          2.sbW,
                          Center(
                              child: SvgPicture.asset(
                            AppAssets.arrowRight,
                            color: currentIndex == 0 ? AppColors.white100 : null,
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                  itemCount: screens.length,
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (screens[index].img != null)
                            Center(
                              child: Container(padding: const EdgeInsets.symmetric(horizontal: 20), child: Image.asset(screens[index].img!)),
                            ),
                          Expanded(flex: 1, child: Container()),
                          if (screens[index].title != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                screens[index].title!,
                                textAlign: TextAlign.left,
                                style: Config.h2(context).copyWith(fontWeight: FontWeight.w900, color: currentIndex == 0 ? AppColors.white100 : AppColors.textBlack, fontSize: 31.sp),
                              ),
                            ),
                          12.0.sbH,
                          if (screens[index].text != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                screens[index].text!,
                                textAlign: TextAlign.left,
                                style: Config.h2(context).copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: currentIndex == 0 ? AppColors.white100 : AppColors.textBlack),
                              ),
                            ),
                          28.sbH,
                          AppButton(
                            color: currentIndex == 0 ? AppColors.white100 : AppColors.textBlack,
                            textColor: currentIndex == 0 ? AppColors.textBlack : AppColors.white100,
                            text: currentIndex == 3 ? "Get Started" : "Next",
                            onTap: () {},
                          ),
                          50.sbH
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

extension WidgetExt on num {
  Widget get sbH => SizedBox(height: toDouble());
  Widget get sbW => SizedBox(width: toDouble());
}

class OnboardModel {
  String? img;
  String? text;
  String? title;
  String? bgImage;
  OnboardModel({this.img, this.text, this.title, this.bgImage});
}
