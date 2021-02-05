import 'package:flutter/material.dart';
import 'package:flutterstudydemo/pages/shrine/colors.dart';

class ShrineSign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _userNameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SHRINE"),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80),
            Column(
              children: <Widget>[
                Image.asset(
                    "lib/assets/diamond.png",
//                    color: kShrineBackgroundWhite
                ),
                SizedBox(height: 16.0),
                Text("SHRINE"),
                SizedBox(height: 80),
                AccentColorOverride(
                  color: kShrineAltYellow,
                  child: TextField(
                    controller: _userNameController,
                    decoration: InputDecoration(
//                    filled: true,
                      labelText: "Username",
                    ),
                  ),
                ),
                SizedBox(height: 12),
                AccentColorOverride(
                  color: kShrineAltYellow,
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
//                    filled: true,
                      labelText: "Password",
                    ),
                    obscureText: true,
                  ),
                )
              ],
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text("CANCEL"),
                  onPressed: () {
                    _userNameController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                  child: Text("NEXT"),
                  elevation: 2.0,
                  onPressed: () {
                    Navigator.pushNamed(context, "shrineHome");
                    _userNameController.clear();
                    _passwordController.clear();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AccentColorOverride extends StatelessWidget {
  final Color color;
  final Widget child;

  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(primaryColor: color),
    );
  }
}
