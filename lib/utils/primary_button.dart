
import 'package:admin/utils/app_size.dart';
import 'package:flutter/cupertino.dart';

import 'app_color.dart';

class PrimaryButton extends StatefulWidget {

  final String text;
  final double width;
  const PrimaryButton({Key? key,required this.text,this.width=250}) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Container(
      width: widget.width,
      padding: EdgeInsets.symmetric(vertical: AppSizes.appHorizontalSm*1.2),
      decoration: BoxDecoration(
        color: AppColors.kPrimary,
        borderRadius: BorderRadius.circular(AppSizes.appHorizontalSm*3)
      ),
      child: Center(child: Text(widget.text,style: TextStyle(color: AppColors.kWhite,fontWeight: FontWeight.w400,fontSize: AppSizes.appHorizontalSm*1.7),)),
    );
  }
}
