import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/paper_detail_controller.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:study_app/screens/detail/answer_check_screen.dart';
import 'package:study_app/screens/detail/quiz_overview_screen.dart';
import 'package:study_app/screens/home/home_screen.dart';
import 'package:study_app/screens/introduction/introduction_screen.dart';
import 'package:study_app/screens/login/login_screen.dart';
import 'package:study_app/screens/detail//result_screen.dart';
import 'package:study_app/screens/splash/splash_screen.dart';

import '../screens/detail/paper_detail_screen.dart';

class AppRoutes{
  static List<GetPage>routes()=>[
    GetPage(name: "/", page: ()=>const SplashScreen()),
    GetPage(name: "/introduction", page: ()=>const IntroductionScreen(),transition: Transition.rightToLeft),
    GetPage(name: "/home", page: ()=> HomeScreen(), binding: BindingsBuilder(
        (){
          Get.put(QuestionPaperController());
        }
    )),
    GetPage(name: "/login", page: ()=>const LoginScreen()),
    GetPage(name: "/detail", page: ()=>PaperDetailScreen(), binding: BindingsBuilder(
        (){
          Get.put(PaperDetailController());
        }
    )),
    GetPage(name: "/overview", page: ()=>QuizOverviewScreen()),
    GetPage(name: "/result", page: ()=>ResultScreen()),
    GetPage(name: "/checkAnswer", page: ()=>AnswerCheckScreen()),
  ];
}
