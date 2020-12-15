import 'package:flutter/material.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/enter_qty.dart';
import 'package:machine_test/widgets/image_from_network.dart';
import 'package:machine_test/widgets/normal_text.dart';

class BuildDishes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _qtyController = TextEditingController();
    _qtyController.text = "5";
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: AppTheme.secondaryGreyColor,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => _buildDish(),
      ),
    );
  }

  Widget _buildDish() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.radio_button_checked,
                      color: AppTheme.primaryGreenColor,
                      size: AppTheme.iconSizeM,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: NormalText(
                        "Spinach and Salad",
                        size: AppTheme.fontSizeL,
                        boldText: true,
                        color: AppTheme.primaryGreyColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 31, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NormalText(
                        "INR7.95",
                        boldText: true,
                        color: AppTheme.primaryGreyColor,
                      ),
                      NormalText(
                        "15 Caories",
                        boldText: true,
                        color: AppTheme.primaryGreyColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 31, right: 15),
                  child: NormalText(
                    "Ggjkgsdkjfhdshlkgfk ld sgljl sgljl sgljlss sgljl sgljl sgljl sgljl sgljl",
                    color: AppTheme.secondaryGreyColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 31),
                  child: EnterQty(),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: NormalText(
                    "Customizible",
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ImageFromNetwork(
              "http://restaurants.unicomerp.net//images/Restaurant/1010000001/Item/Items/100000001.jpg",
            ),
          )
        ],
      ),
    );
  }
}
