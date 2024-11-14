import 'package:flutter/material.dart';
import 'package:shop_app/Features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';
import 'package:shop_app/core/utils/functions/submit.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: (() {
                submit(context);
              }),
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
      body: const OnBoardingViewBody(),
    );
  }
}
