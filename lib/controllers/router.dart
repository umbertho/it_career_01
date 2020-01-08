import 'package:flutter/material.dart';
import '../views/first_page.dart';
import '../views/second_page.dart';
import '../models/data_scheme/initial_test_scheme.dart';
import '../models/data_values/initial_test_values.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/second':
        SecondPageRouter secondPage = new SecondPageRouter();
        return secondPage.getRoute(settings);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class SecondPageRouter {
  static final SecondPageRouter _singleton = new SecondPageRouter._internal();

  factory SecondPageRouter() {
    return _singleton;
  }

  SecondPageRouter._internal() {
    debugPrint("Second page singleton initializer");
  }

  List<InitialTest> questions;
  List<int> points;

  MaterialPageRoute getRoute(RouteSettings settings) {
    InitialTest actualQuestion, previousQuestion;
    Map args = settings.arguments;
    int index, answerClicked, prevInd;
    initializeLists();
    if (args != null) {
      index = args["index"];
      answerClicked = args["answers_clicked"];
    }
    prevInd = index - 1;
    if (prevInd < 0) prevInd = 0;
    previousQuestion = questions[prevInd];
    if (previousQuestion.correctAnswer == answerClicked && index != 0) {
      this.points[prevInd] = 1;
    } else {
      this.points[prevInd] = 0;
    }
    if (questions.length <= index) {
      return _endRoute();
    } else {
      actualQuestion = questions[index];
      return MaterialPageRoute(
          builder: (_) => SecondPage(questions[index].question,
              questions[index].title, questions[index].answers, index));
    }
  }

  void initializeLists() {
    if (this.questions == null) {
      this.questions = initializeList();
      this.points = new List(questions.length);
      for (int i = 0; i < points.length; i++) {
        points[i] = 0;
      }
    }
  }

  Route<dynamic> _endRoute() {
    int sum = 0;
    for (int i = 0; i < points.length; i++) {
      sum = sum + points[i];
    }
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('End'),
        ),
        body: Center(
          child: Text(sum.toString()),
        ),
      );
    });
  }
}
