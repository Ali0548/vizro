import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../utils/app_color.dart';
import '../../utils/app_size.dart';
import '../../utils/custom_snackbar.dart';
import '../../utils/custom_text_field.dart';
import '../../utils/primary_button.dart';
import '../main/main_screen.dart';
enum SingingCharacter { PhoneNumber, emailAddress }
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}
RxBool isPhoneNumber=false.obs;
class _SignInScreenState extends State<SignInScreen> {
  // get onChanged => null;

  SingingCharacter? _character = SingingCharacter.emailAddress;
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
                left: AppSizes.appHorizontalSm * 2,
                right: AppSizes.appHorizontalSm * 2),
            child: Column(
              children: [
                SizedBox(
                  height: AppSizes.appHorizontalSm,
                ),
                Center(
                  child: CircleAvatar(
                      radius: 100,
                      child: Image.asset("assets/images/splash_logo.jpeg")),
                ),
                Container(
                    padding: EdgeInsets.only(left: AppSizes.appHorizontalSm*1.3,top: AppSizes.appHorizontalSm,bottom: AppSizes.appHorizontalSm ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Verify By",
                      style: TextStyle(
                        color: AppColors.kBlack,
                        fontSize: AppSizes.appHorizontalMd * 0.7,
                      ),
                    )),

                Row(children: [
                  Radio<SingingCharacter>(
                    activeColor: AppColors.kPrimary,
                    value: SingingCharacter.emailAddress,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      isPhoneNumber.value=false;
                      setState(() {
                        print("$value");
                        _character = value;
                      });
                    },
                  ),
                  const Text("Email Address",style: TextStyle(color: AppColors.kBlack),),
                  SizedBox(
                    width: AppSizes.appHorizontalSm * 2,
                  ),
                  Radio<SingingCharacter>(
                    activeColor: AppColors.kPrimary,
                    value: SingingCharacter.PhoneNumber,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      isPhoneNumber.value=true;
                      setState(() {
                        print("$value");
                        print("${isPhoneNumber.value}");

                        _character = value;
                      });


                    },
                  ),
                  const Text("Phone Number",style: TextStyle(color: AppColors.kBlack),),
                ]),
                SizedBox(
                  height: AppSizes.appHorizontalMd*1.5,
                ),
                Obx(() {
                  return  CustomTextField(
                    hintText: isPhoneNumber.value?"+9200000":"abcd@gmail.com",
                    inputType: isPhoneNumber.value?TextInputType.phone:TextInputType.emailAddress,
                    // isPassword: true,
                    controller: isPhoneNumber.value?phone:email,
                    prefixIcon: Icon(
                      isPhoneNumber.value?FontAwesomeIcons.mobile:
                      FontAwesomeIcons.envelope,color: AppColors.kBlack.withOpacity(0.6),
                      // Icons.email_outlined,
                      // color: AppColors.kBlack,
                      size: 25,
                    ),
                    // suffixIcon: Icon(FontAwesomeIcons.,color: AppColors.kPrimary,),
                    suffixIcon: Icon(Icons.check_circle,color: AppColors.kPrimary,),
                  );
                }),
                SizedBox(
                  height: AppSizes.appHorizontalSm*3,
                ),
                CustomTextField(
                  hintText:"******",
                  inputType: TextInputType.visiblePassword,
                  // inputFormatters:
                  isPassword: true,
                  controller: password,
                  prefixIcon: Icon(
                    FontAwesomeIcons.lock,color: AppColors.kBlack.withOpacity(0.6),
                    // Icons.lock_outline_sharp,
                    // color: AppColors.kBlack,
                    size: 20,
                  ),
                  suffixIcon: Icon(Icons.check_circle,color: AppColors.kPrimary,),
                ),
                SizedBox(
                  height: AppSizes.appHorizontalSm*3,
                ),
                const Text("Forgot Password?",style: TextStyle(color: AppColors.kTextColor),),
                SizedBox(height: AppSizes.appHorizontalSm*3,),
                InkWell(
                    onTap: (){
                      print("=======CircularButton pressed============");
                      if((email.text=="admin"|| phone.text=="03040439995")&& password.text=="admin"){
                        print("==email:${email.text}=========");
                        print("==phone:${phone.text}=========");
                        print("==password:${password.text}=========");
                        Get.to(()=>MainScreen());
                      }else{
                        showCustomSnackBar("please check your credential's ");
                      }
                      // Get.to(()=>const DashBoardScreen());
                    },
                    child: const PrimaryButton(text: "Login",)),
                SizedBox(height: AppSizes.appHorizontalSm*2.5,),
                InkWell(
                    onTap: (){
                      print("======PrimaryButton pressed=============");
                      // Get.to(()=>SignUpScreen());
                    },
                    child: PrimaryButton(text: 'Create Account',)),
                SizedBox(height: AppSizes.appHorizontalSm*2.5,),
                RichText(text: const TextSpan(
                    text: "By signing in, you are agree with our",
                    style: TextStyle(color: AppColors.kGray),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Terms & Conditions",style: TextStyle(
                          color:AppColors.kTextColor
                      )
                      )
                    ]
                ))
              ],
            )),
      ),

    );
  }
}
