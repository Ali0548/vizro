import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Active Orders",
    numOfFiles: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "32",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Monthly Income",
    numOfFiles: 0,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "Rs: 450021",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Total Customers",
    numOfFiles: 4,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "2411",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Order Completion",
    numOfFiles: 2,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "2342",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
