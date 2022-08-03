
import 'package:ubenwa_daniel/core/model/LoginPayload.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ubenwa_daniel/ui/screens/login/login_view_model.dart';
import 'package:ubenwa_daniel/ui/widget/general_button.dart';
import 'package:ubenwa_daniel/utils/colors.dart';
import 'package:ubenwa_daniel/utils/helpers.dart';
import 'package:ubenwa_daniel/utils/locator.dart';
import 'package:ubenwa_daniel/utils/router/navigation_service.dart';
import 'package:ubenwa_daniel/utils/router/route_names.dart';
import 'package:ubenwa_daniel/utils/screensize.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool passwordVisible;
  String? fcmToken;
  var id;
  late bool active = false;

  @override
  void initState() {
    super.initState();

    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 120,
                  ),
                  Center(
                    child: Text(
                      "Test App",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                        color: AppColors.white,
                      ),
                      height: Responsive.height(context) / 1.6,
                      child:  SingleChildScrollView(
                          child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 22),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 10),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: Validators().isEmpty,
                                controller: emailController,
                                //maxLength: 11,
                                decoration: InputDecoration(
                                  hintText: 'deo@gmail.com',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  fillColor: AppColors.lowGrey,
                                  filled: true,
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.lowGrey),
                                  ),
                                  disabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.lowGrey),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.lowGrey),
                                  ),
                                  labelStyle:
                                      const TextStyle(color: AppColors.black),
                                  errorStyle:
                                      const TextStyle(color: AppColors.red),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(),
                                  ),
                                ),
                                onChanged: (v) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(color: Colors.black),
                                cursorColor: Colors.black,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 10),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: Validators().isPassword,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),
                                  hintText: '*******',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  filled: true,
                                  fillColor: AppColors.lowGrey,
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.lowGrey),
                                  ),
                                  disabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.lowGrey),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColors.lowGrey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(),
                                  ),
                                  errorStyle:
                                      const TextStyle(color: AppColors.red),
                                ),
                                onChanged: (v) {
                                  setState(() {});
                                },
                                obscureText: passwordVisible,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(color: Colors.black),
                                cursorColor: Colors.black,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                  onTap: () {
                                    //   _navigationService.navigateTo(forgotPasswordRoute);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(""),
                                      InkWell(
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 11,
                                              color: AppColors.secondaryColor),
                                        ),
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                  child: Container(
                                      width: 110,
                                      height: 38,
                                      //padding: const EdgeInsets.all(20),
                                      child: GeneralButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                           // _navigationService.navigateTo(HomeRoute);
                                             model.signIn(LoginPayload(
                                                phone: emailController.text,
                                                password: passwordController.text,));
                                          }
                                        },
                                        buttonText: 'Login',
                                      ))),
                              const SizedBox(
                                height: 50,
                              ),
                              Center(
                                child: InkWell(
                                    onTap: () {
                                      _navigationService
                                          .navigateTo(registerRoute);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Don’t have an account?',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.grey),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              _navigationService
                                                  .navigateTo(registerRoute);
                                            },
                                            child: Text(
                                              'Sign Up',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 15,
                                                  color:
                                                      AppColors.secondaryColor,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ) )))
                ],
              )));
        });
  }
}
