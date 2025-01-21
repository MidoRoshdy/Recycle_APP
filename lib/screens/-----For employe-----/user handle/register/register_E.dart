// ignore_for_file: prefer_const_constructors, camel_case_types, file_names, deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/core/assets.dart';
import 'package:recycle_app/screens/-----For%20employe-----/user%20handle/register/provider/register_provder.dart';
import 'package:sizer/sizer.dart';

class Register_E extends StatefulWidget {
  const Register_E({super.key});

  @override
  State<Register_E> createState() => login_E();
}

class login_E extends State<Register_E> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Sign Up'),
      //   backgroundColor: Colors.green,
      // ),
      body: SingleChildScrollView(
        // إضافة SingleChildScrollView لتفعيل التمرير
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Iconsax.arrow_left)),
                  Text("Sign up ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.sp)),
                  Image.asset(
                    Assets.employee,
                    scale: 4,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.logo, scale: 5.sp),
                ],
              ),
              SizedBox(height: 5),
              // Name field
              Text(
                'Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),

              Container(
                alignment: Alignment.center,
                height: 8.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 3.sp,
                        color:
                            context.watch<CreateAccountProvider>().state.name ==
                                    null
                                ? Colors.grey
                                : context
                                            .watch<CreateAccountProvider>()
                                            .state
                                            .usernameErrorMessage !=
                                        null
                                    ? Colors.red
                                    : Colors.green)),
                child: TextField(
                  controller: context
                      .read<CreateAccountProvider>()
                      .state
                      .UsernameController,
                  onChanged: context.read<CreateAccountProvider>().nameChange,
                  onSubmitted: context.read<CreateAccountProvider>().nameChange,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Username",
                    prefixIcon: const Icon(
                      Iconsax.user,
                    ),
                    prefixIconColor:
                        context.watch<CreateAccountProvider>().state.email ==
                                null
                            ? Colors.grey
                            : context
                                        .watch<CreateAccountProvider>()
                                        .state
                                        .emailErrorMessage !=
                                    null
                                ? Colors.red
                                : Colors.green,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Email field
              Text(
                'Email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.center,
                height: 8.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 3.sp,
                        color: context
                                    .watch<CreateAccountProvider>()
                                    .state
                                    .email ==
                                null
                            ? Colors.grey
                            : context
                                        .watch<CreateAccountProvider>()
                                        .state
                                        .emailErrorMessage !=
                                    null
                                ? Colors.red
                                : Colors.green)),
                child: TextField(
                  controller: context
                      .read<CreateAccountProvider>()
                      .state
                      .emailController,
                  onChanged:
                      context.read<CreateAccountProvider>().onEmailChange,
                  onSubmitted:
                      context.read<CreateAccountProvider>().onEmailChange,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    prefixIcon: const Icon(
                      Iconsax.sms4,
                    ),
                    prefixIconColor:
                        context.watch<CreateAccountProvider>().state.email ==
                                null
                            ? Colors.grey
                            : context
                                        .watch<CreateAccountProvider>()
                                        .state
                                        .emailErrorMessage !=
                                    null
                                ? Colors.red
                                : Colors.green,
                  ),
                ),
              ),
              SizedBox(height: 20),
              /////////////////////////// Number field/////////////////////////////////////////
              Text(
                'Number',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(1.w),
                margin: EdgeInsets.only(bottom: 2.h),
                alignment: Alignment.center,
                height: 8.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 4.sp, color: Colors.grey)),
                child: InternationalPhoneNumberInput(
                  keyboardType: TextInputType.number,
                  onSaved:
                      context.read<CreateAccountProvider>().onPhoneNumberChange,
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.DIALOG,
                  ),
                  ignoreBlank: true,
                  onInputChanged:
                      context.read<CreateAccountProvider>().onPhoneNumberChange,
                  inputBorder: InputBorder.none,
                ),
              ),
              Divider(
                height: 1.h,
                color: Colors.transparent,
              ),
              // Password field
              Text(
                'Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.center,
                height: 8.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 3.sp,
                        color: context
                                    .watch<CreateAccountProvider>()
                                    .state
                                    .password ==
                                null
                            ? Colors.grey
                            : context
                                        .watch<CreateAccountProvider>()
                                        .state
                                        .passwordErrorMessage !=
                                    null
                                ? Colors.red
                                : Colors.green)),
                child: TextField(
                  obscureText:
                      context.watch<CreateAccountProvider>().state.hidePass,
                  controller: context
                      .read<CreateAccountProvider>()
                      .state
                      .passwordController,
                  onChanged:
                      context.read<CreateAccountProvider>().onPasswordChange,
                  onSubmitted:
                      context.read<CreateAccountProvider>().onPasswordChange,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      prefixIcon: const Icon(
                        Iconsax.lock,
                      ),
                      prefixIconColor: context
                                  .watch<CreateAccountProvider>()
                                  .state
                                  .password ==
                              null
                          ? Colors.grey
                          : context
                                      .watch<CreateAccountProvider>()
                                      .state
                                      .passwordErrorMessage !=
                                  null
                              ? Colors.red
                              : Colors.green,
                      suffixIcon: IconButton(
                        onPressed: () => context
                            .read<CreateAccountProvider>()
                            .showPassword(),
                        icon: context
                                    .watch<CreateAccountProvider>()
                                    .state
                                    .hidePass ==
                                true
                            ? const Icon(Iconsax.eye_slash4)
                            : const Icon(Iconsax.eye3),
                      )),
                ),
              ),
              Divider(
                height: 1.h,
                color: Colors.transparent,
              ),
              Text("Password must be at least 8 characters",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color:
                        context.watch<CreateAccountProvider>().state.password ==
                                null
                            ? Colors.grey
                            : context
                                        .watch<CreateAccountProvider>()
                                        .state
                                        .passwordErrorMessage !=
                                    null
                                ? Colors.red
                                : Colors.green,
                  )),

              Divider(
                height: 1.h,
                color: Colors.transparent,
              ),
              // Confirm Password field
              Text(
                'Confirm Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Divider(
                height: 1.h,
                color: Colors.transparent,
              ),
              Container(
                alignment: Alignment.center,
                height: 8.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 3.sp,
                        color: context
                                    .watch<CreateAccountProvider>()
                                    .state
                                    .Retypepassword ==
                                null
                            ? Colors.grey
                            : context
                                        .watch<CreateAccountProvider>()
                                        .state
                                        .RetypepasswordErrorMessage !=
                                    null
                                ? Colors.red
                                : Colors.green)),
                child: TextField(
                  obscureText:
                      context.watch<CreateAccountProvider>().state.hidePass2,
                  controller: context
                      .read<CreateAccountProvider>()
                      .state
                      .RetypepasswordController,
                  onChanged: context
                      .read<CreateAccountProvider>()
                      .RetypePasswordChange,
                  onSubmitted: context
                      .read<CreateAccountProvider>()
                      .RetypePasswordChange,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Retype Password",
                      prefixIcon: const Icon(
                        Iconsax.lock,
                      ),
                      prefixIconColor: context
                                  .watch<CreateAccountProvider>()
                                  .state
                                  .Retypepassword ==
                              null
                          ? Colors.grey
                          : context
                                      .watch<CreateAccountProvider>()
                                      .state
                                      .RetypepasswordErrorMessage !=
                                  null
                              ? Colors.red
                              : Colors.green,
                      suffixIcon: IconButton(
                        onPressed: () => context
                            .read<CreateAccountProvider>()
                            .showPassword2(),
                        icon: context
                                    .watch<CreateAccountProvider>()
                                    .state
                                    .hidePass2 ==
                                true
                            ? const Icon(Iconsax.eye_slash4)
                            : const Icon(Iconsax.eye3),
                      )),
                ),
              ),
              //! password error message
              Text("Password must be same as the first password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color:
                        context.watch<CreateAccountProvider>().state.password ==
                                context
                                    .watch<CreateAccountProvider>()
                                    .state
                                    .Retypepassword
                            ? Colors.green
                            : context
                                        .watch<CreateAccountProvider>()
                                        .state
                                        .RetypepasswordErrorMessage !=
                                    null
                                ? Colors.red
                                : Colors.green,
                  )),
              Divider(
                height: 1.h,
                color: Colors.transparent,
              ),
              // Agree to terms checkbox
              Row(
                children: [
                  Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateColor.resolveWith((states) {
                        return context
                                .watch<CreateAccountProvider>()
                                .state
                                .terms
                            ? Colors.green
                            : Colors.white;
                      }),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      value: context.watch<CreateAccountProvider>().state.terms,
                      onChanged:
                          context.read<CreateAccountProvider>().onChangeterms),
                  Text('I Agree To The '),
                  GestureDetector(
                    onTap: () {
                      // Open Terms and Conditions page
                    },
                    child: Text(
                      'Terms & Conditions',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Container(
                width: 90.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: Color(0xff649014),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // OR divider
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Sign up with Google button
              InkWell(
                onTap: () {},
                child: Container(
                  width: 90.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      VerticalDivider(
                        width: 25.w,
                        color: Colors.transparent,
                      ),
                      Image.asset(
                        Assets.google,
                        scale: 1,
                      ),
                      VerticalDivider(
                        width: 1.w,
                        color: Colors.transparent,
                      ),
                      Text("Sign up with Google ")
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Already have an account?
            ],
          ),
        ),
      ),
    );
  }
}
