const String imagePath = "assets/images";
const String jsonPath = "assets/json";
const String iconsPath = "assets/icons";
const String svgPath = "assets/svg_images";

abstract class ImageAssets {
  static const String routeLogo = "$imagePath/splash_logo.png";
  static const String categoryCardImage = "$imagePath/category_card_image.png";

  static const String subcategoryCardImage =
      "$imagePath/sub_category_card_image.png";
  static const String carouselSlider1 = "$imagePath/CarouselSlider1.png";

  static const String categoryHomeImage = "$imagePath/category_image.jpg";
  static const String carouselSlider2 = "$imagePath/CarouselSlider2.png";
  static const String carouselSlider3 = "$imagePath/CarouselSlider3.png";
  static const String brandHomeImage = "$imagePath/brands_section_image.png";
  static const String productImage = "$imagePath/product_image.png";

  static const String rate = "$imagePath/rate.png";

  static const String shoppingCart = "$imagePath/shopping_cart.png";
  static const String favoriteIcon = "$imagePath/favorite.png";
  static const String notFavoriteIcon = "$imagePath/not_favorite.png";
  static const String searchIcon = "$imagePath/search.png";
}

class SvgAssets{
  static const String routeLogo = "$svgPath/route.svg";
  static const String eye = "$svgPath/Eye.svg";
  static const String edit = "$svgPath/edit (1) 5.svg";
}

abstract class IconsAssets {
  static const String _icCategory = "$iconsPath/ic_category.png";
  static const String _icHome = "$iconsPath/ic_home.png";
  static const String _icProfile = "$iconsPath/ic_profile.png";
  static const String _icWithList = "$iconsPath/ic_wish_list.png";
  static const String _icCart = "$iconsPath/ic_cart.png";
  static const String _icSearch = "$iconsPath/ic_search.png";
  static const String icDelete = "$iconsPath/ic_delete.png";
  static const String _icHeart = "$iconsPath/heart.png";
  static const String _icClickedHeart = "$iconsPath/clicked_heart.png";

  static String get icCategory => _icCategory;
  static String get icHome => _icHome;
  static String get icProfile => _icProfile;
  static String get icWithList => _icWithList;
  static String get icCart => _icCart;
  static String get icSearch => _icSearch;
  static String get icHeart => _icHeart;
  static String get icClickedHeart => _icClickedHeart;
}



class JsonAssets {
  static const String loading = "$jsonPath/loading.json";
  static const String error = "$jsonPath/error.json";
  static const String empty = "$jsonPath/empty.json";
  static const String success = "$jsonPath/success.json";
}
