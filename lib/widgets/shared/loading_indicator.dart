import 'package:flutter/material.dart';

import '../../config/size_config.dart';

class LoadingIndicator extends StatelessWidget {
  final String loadingText;

  LoadingIndicator({
    this.loadingText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        loadingText.isNotEmpty
            ? Text(
                loadingText,
                style: TextStyle(
                  fontSize: 2 * SizeConfig.safeBlockHorizontal,
                ),
              )
            : Container(),
      ],
    );
  }
}
