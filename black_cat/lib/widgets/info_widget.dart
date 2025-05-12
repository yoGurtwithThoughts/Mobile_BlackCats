import 'package:black_cat/model/info_banner.dart';
import 'package:black_cat/widgets/content_pop_message.dart';
import 'package:flutter/material.dart';
import 'package:black_cat/widgets/styletxt.dart';

class InfoRow extends StatelessWidget {
  final InfoRowData data;
  final double iconSize;

  const InfoRow({
    Key? key,
    required this.data,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCustomPopup(
          context,
          data.popupTitle,
          data.popupDescription,
          imageWidget: data.popupImage,
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: iconSize,
            height: iconSize,
            child: data.widgetIcon,
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              data.title,
              style: TextStylesMain.apptxt,
            ),
          ),
        ],
      ),
    );
  }
}
