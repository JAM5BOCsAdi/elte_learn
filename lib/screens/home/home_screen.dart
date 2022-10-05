import 'package:elte_learn/configs/themes/ui_parameters.dart';
import 'package:elte_learn/controllers/question_paper/question_paper_controller.dart';
import 'package:elte_learn/screens/home/question_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(
      body: Obx(
        () => ListView.separated(
          padding: UIParameters.mobileScreenPadding,
          itemBuilder: (BuildContext context, int index) {
            return QuestionCard(model: _questionPaperController.allPapers[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Gap(20);
          },
          itemCount: _questionPaperController.allPapers.length,
        ),
      ),
    );
  }
}
