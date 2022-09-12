import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/widgets/answer_card_widget.dart';


class QuizNumberCard extends StatelessWidget {
  const QuizNumberCard({Key? key, required this.status, required this.index, required this.onTap}) : super(key: key);

  final AnswerStatus status;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor = Theme.of(context).primaryColor;
    switch (status) {
      case AnswerStatus.answered:
        _backgroundColor = Theme.of(context).primaryColor;
        break;
      case AnswerStatus.correct:
        _backgroundColor = Colors.green;
        break;
      case AnswerStatus.wrong:
        _backgroundColor = Colors.red;
        break;
      case AnswerStatus.notAnswered:
        _backgroundColor = Theme.of(context).primaryColor.withOpacity(0.1);
        break;
      default:
        _backgroundColor = Theme.of(context).primaryColor.withOpacity(0.1);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(20),
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(index.toString(),style: const TextStyle(
            color: onSurfaceTextColor
          ),),
        ),
      ),
    );
  }
}
