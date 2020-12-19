class HomeModel {
  List<HomeCategory> homecategories;

  void fillHomeCategories(Map<String, dynamic> json) {
    homecategories = new List<HomeCategory>();

    json['table_menu_list'].forEach((v) {
      homecategories.add(new HomeCategory.fromJson(v));
    });
  }
}

class HomeCategory {
  final String categoryName;
  final List<HomeDishes> homeDishes;

  HomeCategory(this.categoryName, this.homeDishes);

  factory HomeCategory.fromJson(Map<String, dynamic> json) {
    List<HomeDishes> homeDishesList = new List<HomeDishes>();

    json['category_dishes'].forEach((v) {
      homeDishesList.add(new HomeDishes.fromJson(v));
    });

    return HomeCategory(json['menu_category'], homeDishesList);
  }
}

class HomeDishes {
  final String dishId;
  final String dishName;
  final String dishDescription;
  final String imageUrl;
  final double calories;
  final double price;
  final bool isVeg;
  final bool isCustomizable;

  HomeDishes(this.dishId, this.dishName, this.dishDescription, this.imageUrl,
      this.calories, this.price, this.isVeg, this.isCustomizable);

  factory HomeDishes.fromJson(Map<String, dynamic> json) {
    bool customizationOption = false;

    if (json['addonCat'].length > 0) {
      customizationOption = true;
    }

    return HomeDishes(
      json['dish_id'],
      json['dish_name'],
      json['dish_description'],
      json['dish_image'],
      json['dish_calories'],
      json['dish_price'],
      json['dish_Type'] == 2 ? true : false,
      customizationOption,
    );
  }
}
