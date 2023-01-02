import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../configs/themes/ui_parameters.dart';

class QuestionPlaceHolder extends StatelessWidget {
  const QuestionPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    Container line = Container(
      width: double.infinity,
      height: getHeight * 0.025,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    Container answer = Container(
      width: double.infinity,
      height: getHeight * 0.075,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.blueGrey.withOpacity(0.5),
      child: EasySeparatedColumn(
        separatorBuilder: (BuildContext context, int index) {
          return Gap(getHeight * 0.025);
        },
        children: [
          EasySeparatedColumn(
            children: [
              line,
              line,
              line,
            ],
            separatorBuilder: (BuildContext context, int index) {
              return Gap(getHeight * 0.025);
            },
          ),
          answer,
          answer,
          answer,
        ],
      ),
    );
  }
}
