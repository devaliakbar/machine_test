import 'package:flutter/material.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/normal_text.dart';

class BuildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: AppTheme.secondaryGreenColor,
      ),
      child: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NormalText(
                        "Browse",
                        color: Colors.black,
                        boldText: true,
                        size: AppTheme.fontSizeL,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: AppTheme.iconSizeM,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: ListTile.divideTiles(
                        context: context,
                        color: AppTheme.primaryGreenColor,
                        tiles: [
                          ListTile(
                            title: NormalText(
                              "Home",
                              color: Colors.black,
                            ),
                            leading: Icon(
                              Icons.home_outlined,
                              size: AppTheme.iconSizeS,
                            ),
                          ),
                          ListTile(
                            title: NormalText(
                              "Categories",
                              color: Colors.black,
                            ),
                            leading: Icon(
                              Icons.category_outlined,
                              size: AppTheme.iconSizeS,
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            title: NormalText(
                              "Compare",
                              color: Colors.black,
                            ),
                            leading: Icon(
                              Icons.compare,
                              size: AppTheme.iconSizeS,
                            ),
                          ),
                          ListTile(
                            title: NormalText(
                              "Cart",
                              color: Colors.black,
                            ),
                            leading: Icon(
                              Icons.shopping_cart,
                              size: AppTheme.iconSizeS,
                            ),
                          ),
                          ListTile(
                            title: NormalText(
                              "Wishlist",
                              color: Colors.black,
                            ),
                            leading: Icon(
                              Icons.favorite_border,
                              size: AppTheme.iconSizeS,
                            ),
                          ),
                          ListTile(
                            title: NormalText(
                              "My Wallet",
                              color: Colors.black,
                            ),
                            leading: Icon(
                              Icons.attach_money_outlined,
                              size: AppTheme.iconSizeS,
                            ),
                          ),
                          ListTile(
                            title: NormalText(
                              "Manage Profile",
                              color: Colors.black,
                            ),
                            leading: Icon(
                              Icons.person_outline,
                              size: AppTheme.iconSizeS,
                            ),
                          ),
                        ]).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.power_settings_new,
                        size: AppTheme.iconSizeS,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      NormalText(
                        "Log Out",
                        color: Colors.black,
                        boldText: true,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
