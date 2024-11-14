import 'package:flutter/material.dart';
import 'package:shop_app/Features/on_boarding/data/models/boarding_model.dart';
import 'package:shop_app/Features/on_boarding/presentation/views/widgets/build_boarding_item.dart';
import 'package:shop_app/core/utils/functions/submit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  List<BoardingModel> boarding = const [
    BoardingModel(
      image: 'assets/images/onboarding1.jpg',
      title: 'On Board 1 ',
    ),
    BoardingModel(
      image: 'assets/images/onboarding2.jpg',
      title: 'On Board 2 ',
    ),
    BoardingModel(
      image: 'assets/images/onboarding3.jpg',
      title: 'On Board 3 ',
    ),
  ];

  var boardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                onPageChanged: (value) {
                  if (value == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                itemCount: boarding.length,
                itemBuilder: (context, index) {
                  return BuildBoardingItem(
                    model: boarding[index],
                  );
                }),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SmoothPageIndicator(
                controller: boardController,
                count: boarding.length,
                effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.lightBlue,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5,
                    expansionFactor: 4),
              ),
              const Spacer(),
              FloatingActionButton(
                onPressed: () {
                  if (isLast) {
                    submit(context);
                  } else {
                    boardController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                child: const Icon(Icons.arrow_forward_ios),
              )
            ],
          )
        ],
      ),
    );
  }
}
