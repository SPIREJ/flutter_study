import 'dart:ffi';

import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignUpFormState();
  }
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _userNameTextController = TextEditingController();

  double _formProgress = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        onChanged: _updateFormProgress,
        child: Column(
          children: <Widget>[
//            LinearProgressIndicator(value: _formProgress),
          AnimatedProgressIndicator(value: _formProgress),
            Text("Sign up", style: Theme.of(context).textTheme.headline),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _firstNameTextController,
                decoration: InputDecoration(hintText: "First name"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _lastNameTextController,
                decoration: InputDecoration(hintText: "Last name"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _userNameTextController,
                decoration: InputDecoration(hintText: "User name"),
              ),
            ),
            RaisedButton(
              child: Text("Sign up"),
              disabledColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
              color:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.blue;
              }),
              // 点击登录，跳转到欢迎页
              onPressed: _formProgress == 1 ? _showWelcomScreen : null,
            ),
          ],
        ));
  }

  void _showWelcomScreen() {
    Navigator.of(context).pushNamed("welcome");
  }

  void _updateFormProgress() {
    var progress = 0.0;
    var controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _userNameTextController
    ];

    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }
}

// 欢迎页
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome!!!"),
      ),
      body: Center(
        child: Text("Welcome!", style: Theme.of(context).textTheme.headline),
      ),
    );
  }
}

// 动态进度条 start
class AnimatedProgressIndicator extends StatefulWidget {
  final double value;
  AnimatedProgressIndicator({@required this.value});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _curveAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1200), vsync: this);
    var colorTween = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.red, end: Colors.orange), weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.yellow, end: Colors.green),
          weight: 1),
    ]);

    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void didUpdateWidget(AnimatedProgressIndicator oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => LinearProgressIndicator(
              value: _curveAnimation.value,
              valueColor: _colorAnimation,
              backgroundColor: _colorAnimation.value.withOpacity(0.4),
            ));
  }
}
// 动态进度条 end
