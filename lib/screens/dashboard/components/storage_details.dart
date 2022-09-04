import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Flow",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Revenue (Monthly)",
            amountOfFiles: "Rs: 28000",
            numOfFiles: 67,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "Sales (Quatarly)",
            amountOfFiles: "7651 Per Product",
            numOfFiles: 72,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/folder.svg",
            title: "Today Impression",
            amountOfFiles: "324",
            numOfFiles: 21,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Unknown",
            amountOfFiles: "unknown",
            numOfFiles: 0,
          ),
        ],
      ),
    );
  }
}
