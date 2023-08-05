import 'package:flutter/material.dart';

double wid(BuildContext context, double w) {
  return MediaQuery.of(context).size.width / w;
}

double hei(BuildContext context, double w) {
  return MediaQuery.of(context).size.height / w;
}