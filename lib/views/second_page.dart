import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String title, question;
  final Map answers;
  final int index;

  SecondPage(this.question, this.title, this.answers, this.index);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = new List();
    Map args = new Map();
    args["index"] = this.index + 1;
    widgetList.add(Container(
        padding: const EdgeInsets.all(11.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [Colors.purple[600], Colors.deepPurple[800]],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
            borderRadius: new BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              new BoxShadow(
                  color: Colors.black.withOpacity(0.6), blurRadius: 20.0)
            ],
          ),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    decoration: TextDecoration.none,
                    fontFamily: "Rubik"),
              ),
              Divider(
                color: Colors.white70,
              ),
              Text(
                question,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    fontFamily: "Roboto"),
              ),
              Divider(
                color: Colors.white70,
              )
            ],
          ),
        )));

    for (int i = 0; i < answers.length; i++) {
      widgetList.add(Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(Radius.circular(20)),
          color: Colors.purple[500].withOpacity(0.8),
          boxShadow: [
            new BoxShadow(
                color: Colors.black.withOpacity(0.6), blurRadius: 20.0)
          ],
        ),
        margin: const EdgeInsets.only(left: 11, right: 11, bottom: 6, top: 6),
        child: FlatButton(
            textColor: Colors.white,
            disabledColor: Colors.grey,
            hoverColor: Colors.cyan,
            splashColor: Colors.amber,
            onPressed: () {
              args["answers_clicked"] = i + 1;
              Navigator.of(context).pushNamed("/second", arguments: args);
            },
            child: Text(answers[i + 1])),
      ));
    }

    return Scaffold(
      backgroundColor: Colors.grey[900].withOpacity(0.1),
      appBar: new AppBar(
        backgroundColor: Colors.indigo[900],
        title: new Text("App"),
      ),
      body: new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [Colors.purple[700], Colors.deepPurple[900]],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
          child: new ListView(children: widgetList)),
    );
  }
}
