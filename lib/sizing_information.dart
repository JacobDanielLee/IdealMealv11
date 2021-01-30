import 'package:flutter/material.dart';


class SizingInformation {
  final Orientation orientation;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.localWidgetSize,
    this.orientation,
    this.screenSize
  });

  @override
  String toString() {

    return 'Orientation: $orientation Screen Size: $screenSize Local Widget Size: $localWidgetSize';
  }
}
