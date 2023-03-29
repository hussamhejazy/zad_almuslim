import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zad_almuslim/components/colors.dart';
import '../../../state_mangament/getx_controllers/quran_getx_controller.dart';
import '../../../utils/size_config.dart';

class QuranBook extends StatefulWidget {
  int? numOfPageStart ;

  QuranBook({Key? key, this.numOfPageStart}) : super(key: key);

  @override
  State<QuranBook> createState() => _QuranBookState(numOfPageStart);
}

class _QuranBookState extends State<QuranBook> {
  int? numOfPageStart;
  late PageController _pageController;
  late QuranGetxController _controller;

  _QuranBookState(this.numOfPageStart);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controller = Get.put(QuranGetxController());
    _controller.updateNumberOfSurha(0);
    moving();
  }

  @override
  void deactivate() {
    _pageController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuranGetxController>(
        builder: (QuranGetxController controller) {
      return Scaffold(
        body: Stack(
          children: [
            Image.asset('assets/images/quran/others/quranBackground.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover),
            SafeArea(
              child: Stack(
                children: [
                  PageView.builder(
                      controller: _pageController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 605,
                      onPageChanged: (int page) {
                        controller.updateNumberOfSurha(page);
                      },
                      itemBuilder: (context, index) {
                        var _numberOfAya = index + 1;
                        //numberOfAya.toString().padLeft(3, '0')
                        return GestureDetector(
                          onTap: () {
                            showDialog(context);
                          },
                          child: Image.asset(
                            'assets/images/quran/$_numberOfAya.png',
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                            color: controller.isLightMode
                                ? Colors.transparent
                                : const Color(0xFFEAEAAC),
                            colorBlendMode: BlendMode.darken,
                            //Color(0xFFEAEAAC)
                            //BlendMode.darken
                          ),
                        );
                      }),
                  Visibility(
                      visible: (controller.currentNumberOfSurha ==
                              controller.indexMark)
                          ? true
                          : false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.bookmark_sharp,
                            color: outlineCardHomePage,
                            size: SizeConfig().scaleWidth(60),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Future<void> moving({int index = 0}) async {
    await Future.delayed(const Duration(microseconds: 1), () {
      _pageController
          .jumpToPage((numOfPageStart == null) ? index : numOfPageStart! - 1);
    });

    if(numOfPageStart != null){
      _controller.updateNumberOfSurha(numOfPageStart! - 1);
    }
  }

  void showDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        barrierColor: Colors.black.withOpacity(0.26),
        backgroundColor: primary.withOpacity(0.8),
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => _controller.indexBookMark(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.bookmark_border,
                            color: outlineCardHomePage,
                          ),
                          Text('حفظ علامة',
                              style: TextStyle(
                                  color: outlineCardHomePage,
                                  fontSize: SizeConfig().scaleTextFont(20))),
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () => moving(index: _controller.indexMark),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.bookmark_border,
                            color: outlineCardHomePage,
                          ),
                          Text('انتقال الى العلامة',
                              style: TextStyle(
                                  color: outlineCardHomePage,
                                  fontSize: SizeConfig().scaleTextFont(20))),
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () => _controller.isLightMode
                          ? _controller.disableLightMode()
                          : _controller.enableLightMode(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: const Icon(
                        Icons.dark_mode_outlined,
                        color: outlineCardHomePage,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () =>  moving(index: 604),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/open-hands.png'),
                          SizedBox(
                            width: SizeConfig().scaleWidth(15),
                          ),
                          Text('دعاء الختم',
                              style: TextStyle(
                                  color: outlineCardHomePage,
                                  fontSize: SizeConfig().scaleTextFont(22))),
                        ],
                      )),
                ],
              ),
            ],
          );
        });
  }
}
