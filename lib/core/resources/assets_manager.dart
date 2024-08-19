const String imagePath = "assets/images";
const String jsonPath = "assets/json";

class ImageAssets {
  static const String splashLogo = "$imagePath/splash_logo.png";

}

class IconsAssets{
  static const String _icCategory = "assets/icons/ic_category.png";
  static const String _icHome = "assets/icons/ic_home.png";
  static const String _icProfile = "assets/icons/ic_profile.png";
  static const String _icWithList = "assets/icons/ic_wish_list.png";

  static String get icCategory => _icCategory;
  static String get icHome => _icHome;
  static String get icProfile => _icProfile;
  static String get icWithList => _icWithList;
}

class JsonAssets {
  static const String loading = "$jsonPath/loading.json";
  static const String error = "$jsonPath/error.json";
  static const String empty = "$jsonPath/empty.json";
  static const String success = "$jsonPath/success.json";
}
