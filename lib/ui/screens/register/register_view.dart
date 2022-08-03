
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ubenwa_daniel/core/model/RegisterModel.dart';
import 'package:ubenwa_daniel/ui/screens/login/login_view_model.dart';
import 'package:ubenwa_daniel/ui/screens/register/register_view_model.dart';
import 'package:ubenwa_daniel/ui/widget/general_button.dart';
import 'package:ubenwa_daniel/utils/colors.dart';
import 'package:ubenwa_daniel/utils/helpers.dart';
import 'package:ubenwa_daniel/utils/locator.dart';
import 'package:ubenwa_daniel/utils/router/navigation_service.dart';
import 'package:ubenwa_daniel/utils/router/route_names.dart';
import 'package:ubenwa_daniel/utils/screensize.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Register> {
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
    return ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 100,
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
                    height: 30,
                  ),
                  Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.grey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.white,
                      ),
                      height: Responsive.height(context) / 1.3,
                      child: SingleChildScrollView(
                          child:  Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "SignUp",
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
                                "Name",
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
                                controller: nameController,
                                //maxLength: 11,
                                decoration: InputDecoration(
                                  hintText: 'Jane Doe',
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
                                validator: Validators().isEmail,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(""),
                                  InkWell(
                                    child: Text(
                                      'By entering your details, your are agreeing to our',
                                      style: TextStyle(
                                          fontSize: 11, color: AppColors.grey),
                                    ),
                                  ),
                                  InkWell(
                                    child: Text(
                                      ' Terms of',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 11,
                                          color: AppColors.secondaryColor),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(""),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Service',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 11,
                                          color: AppColors.secondaryColor),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      ' and ',
                                      style: TextStyle(
                                          fontSize: 11, color: AppColors.grey),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Privacy Policy.',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 11,
                                          color: AppColors.secondaryColor),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      ' Thanks!',
                                      style: TextStyle(
                                          fontSize: 11, color: AppColors.grey),
                                    ),
                                  ),
                                ],
                              ),
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
                                            model.signUp(RegisterModel(
                                                 firstName:nameController.text.split(" ").first,
                                                 lastName:nameController.text.split(" ").last,
                                                 email: emailController.text,
                                                 password:passwordController.text,
                                                 passwordConfirmation:passwordController.text,
                                            ));
                                          }
                                        },
                                        buttonText: 'Sign Up',
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
                                          'Already have an account? ',
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
                                                  .navigateTo(loginRoute);
                                            },
                                            child: Text(
                                              'Login',
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
                          ))))
                ],
              )));
        });
  }
}
