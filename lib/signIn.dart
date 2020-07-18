import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  Animation _animation,
      _delayedAnimation1,
      _delayedAnimation2,
      _delayedAnimation3;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = Tween<double>(begin: -1, end: 0).animate(CurvedAnimation(
        curve: Interval(0.2, 1, curve: Curves.fastOutSlowIn),
        parent: _animationController))
      ..addListener(() {
        setState(() {});
      });

    _delayedAnimation1 = Tween<double>(begin: -1, end: 0).animate(
        CurvedAnimation(
            curve: Interval(0.5, 1, curve: Curves.fastOutSlowIn),
            parent: _animationController))
      ..addListener(() {
        setState(() {});
      });

    _delayedAnimation2 = Tween<double>(begin: -1, end: 0).animate(
        CurvedAnimation(
            curve: Interval(0.6, 1, curve: Curves.fastOutSlowIn),
            parent: _animationController))
      ..addListener(() {
        setState(() {});
      });

    _delayedAnimation3 = Tween<double>(begin: -1, end: 0).animate(
        CurvedAnimation(
            curve: Interval(0.8, 1, curve: Curves.fastOutSlowIn),
            parent: _animationController))
      ..addListener(() {
        setState(() {});
      });

    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: height * 0.01,
              ),
              Transform(
                transform:
                    Matrix4.translationValues(width * _animation.value, 0, 0),
                child: welcomeText(),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Transform(
                      transform: Matrix4.translationValues(
                          width * _delayedAnimation1.value, 0, 0),
                      child: inputEmail(),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          width * _delayedAnimation2.value, 0, 0),
                      child: inputPassword(),
                    ),
                  ],
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(
                    width * _delayedAnimation3.value, 0, 0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            signinText(),
                            submitButton(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            forgotPassword(),
                            signUpText(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputEmail() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: TextField(
        style: TextStyle(
            fontFamily: 'GilroyRegular', color: Colors.white, fontSize: 25),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          hintText: 'Enter email',
          hintStyle: TextStyle(
              fontFamily: 'GilroyRegular', color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget inputPassword() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: TextField(
        style: TextStyle(
            fontFamily: 'GilroyRegular', color: Colors.white, fontSize: 25),
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          hintText: 'Enter password',
          hintStyle: TextStyle(
              fontFamily: 'GilroyRegular', color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget welcomeText() {
    return Container(
        child: Text(
      "Welcome\nBack",
      style: TextStyle(
          fontFamily: 'GilroyRegular', color: Colors.white, fontSize: 50),
    ));
  }

  Widget signinText() {
    return Container(
        child: Text(
      "Sign in",
      style: TextStyle(
          fontFamily: 'GilroyRegular', color: Colors.white, fontSize: 40),
    ));
  }

  Widget submitButton() {
    return GestureDetector(
        child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white.withOpacity(0.2),
      ),
      child: Icon(
        Icons.arrow_forward_ios,
        size: 35,
        color: Colors.white,
      ),
    ));
  }

  Widget forgotPassword() {
    return Container(
        child: Text(
      "Forgot Password?",
      style: TextStyle(
          decoration: TextDecoration.underline,
          fontFamily: 'GilroyRegular',
          color: Colors.white,
          fontSize: 20),
    ));
  }

  Widget signUpText() {
    return Container(
      child: Text(
        "Sign up",
        style: TextStyle(
            decoration: TextDecoration.underline,
            fontFamily: 'GilroyRegular',
            color: Colors.white,
            fontSize: 20),
      ),
    );
  }
}
