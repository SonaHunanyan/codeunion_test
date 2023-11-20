import 'package:codeunion_test/presentation/theme/app_icons.dart';
import 'package:codeunion_test/presentation/theme/app_strings.dart';

enum HomeType { feed, map, favorite, profile }

extension HomeTypeAddition on HomeType {
  String get title {
    switch (this) {
      case HomeType.feed:
        return AppStrings.feed;
      case HomeType.map:
        return AppStrings.map;
      case HomeType.favorite:
        return AppStrings.favorite;
      case HomeType.profile:
        return AppStrings.profile;
    }
  }

  String get icon {
    switch (this) {
      case HomeType.feed:
        return AppIcons.feed;
      case HomeType.map:
        return AppIcons.map;
      case HomeType.favorite:
        return AppIcons.favorite;
      case HomeType.profile:
        return AppIcons.profile;
    }
  }
}
