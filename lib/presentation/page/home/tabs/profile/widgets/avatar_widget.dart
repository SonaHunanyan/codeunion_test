import 'package:codeunion_test/presentation/theme/app_icons.dart';
import 'package:codeunion_test/presentation/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64 * rh(context),
      height: 64 * rh(context),
      child: SvgPicture.asset(
        AppIcons.avatar,
      ),
    );
  }
}
