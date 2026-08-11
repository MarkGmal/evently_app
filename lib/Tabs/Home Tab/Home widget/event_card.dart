import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_images.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.01,
      ),
      width: double.infinity,
      height: height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.birthdayImage),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadiusGeometry.circular(8),
        border: Border.all(color: AppColors.primaryLight, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(height * 0.008),
            margin: EdgeInsets.all(height * 0.005),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadiusGeometry.circular(15),
            ),
            child: Column(
              children: [
                Text("10", style: AppStyles.bold20Primary),
                Text("Nov", style: AppStyles.bold14Primary),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(height * 0.008),
            margin: EdgeInsets.all(height * 0.005),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadiusGeometry.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "This is a Birthday Party",
                    style: AppStyles.bold16Black,
                    softWrap: true,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppImages.favUnselected,
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryLight,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
