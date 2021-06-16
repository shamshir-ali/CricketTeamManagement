import 'package:cricket_team_management/service/login_service.dart';
import 'package:cricket_team_management/util/app_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



String userName = 'user_name';
String userEmail = 'user_email';
String accessToken = 'access_token';
String fcmToken = 'fcm_token';

void main() {
  runApp(MaterialApp(home: LoginView()));
}
class LoginView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => LoginStateView();
}
class LoginStateView extends State<LoginView> {
  LoginService loginService = LoginService();
  AppUtil _appUtil = AppUtil();
  FocusNode passFocusNode = FocusNode();
  String userName = '';
  String password = '';
  void validateData() {
    userName = 'testtest';
    password = '123456';
    if (userName.isEmpty) {
      _appUtil.showOkAlert('Please enter user name', context);
    } else if (password.isEmpty) {
      _appUtil.showOkAlert('Please enter password', context);
    } else {
      try {
        loginService.login(userName, password).then((response) => {
          if (response.code == 200) {
            // Navigator.push(context, new MaterialPageRoute(builder: (context) => MyApp()))
          } else {
            if (response.message != null && response.message.isEmpty) {
              _appUtil.showOkAlert('Failed to login, please try again!', context)
            } else {
              _appUtil.showOkAlert(response.message ?? "", context)

            }
          }
        });
      } catch (exception) {
        _appUtil.showOkAlert(exception.toString(), context);

      }
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: [
          new Container(
            color: Colors.white,
          ),
          Container(
            // color: Colors.black.withAlpha(75),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.greenAccent, Colors.blueAccent ],
                tileMode: TileMode.repeated,
              ),
            ),
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: new Container(
                color: Colors.transparent,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 100),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: new TextField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.name,
                        cursorRadius: Radius.circular(20),
                        onChanged: (String text) => {
                          userName = text
                        },
                        // keyboardAppearance: Brightness.light ,
                        onEditingComplete: () => {
                          passFocusNode.requestFocus()
                        },
                        style: TextStyle(
                          color: Colors.black,
                          backgroundColor: Colors.transparent,
                          decorationColor: Colors.grey.withAlpha(50),

                        ),
                        decoration: InputDecoration(
                          hintText: "User Name",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white, width: 1)
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white, width: 1)
                          ),
                          // border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    new SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: new TextField(
                        focusNode: passFocusNode,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        onChanged: (String text) => {
                          password = text
                        },
                        // keyboardAppearance: Brightness.light,
                        onSubmitted: (String value) {
                          validateData();
                        },
                        style: TextStyle(
                          color: Colors.black,
                          backgroundColor: Colors.transparent,
                          decorationColor: Colors.transparent,
                        ),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          // border: OutlineInputBorder(),
                          counterStyle: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.transparent,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white, width: 1)
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white, width: 1)
                          ),
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        // padding: EdgeInsets.only(top: 0, bottom: 0, left: 50, right:  50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        // color: Colors.white,
                        child: new OutlineButton(onPressed: validateData,
                          padding: EdgeInsets.only(top: 15, bottom: 15, left: 50, right:  50),
                          child: Text('Login', style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          ),
                        ),
                      ) ,
                    )

                  ],
                )
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 100, right: 20),
              child: Image(image: AssetImage('assets/main_logo.png') , fit: BoxFit.fitWidth,),
            ),
          )
        ],
      ),
    );
  }

}