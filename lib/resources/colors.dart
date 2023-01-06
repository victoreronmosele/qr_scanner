import 'package:flutter/material.dart';

/// Color scheme
const primaryColor = Color(0xff03045e);
const accentColor = Color(0xffF72585);

/// General widget colors
const unselectedTabColor = Colors.white38;
const selectedTabColor = accentColor;

const bottomAppBarColor = primaryColor;

const qrBorderColor = accentColor;

const darkModeBaseColor = Color(0xff121212);

final darkBackgroundColor =
    Color.alphaBlend(primaryColor.withOpacity(0.08), darkModeBaseColor);

final elevatedWidgetBackgroundColor =
    Color.alphaBlend(Colors.white.withOpacity(0.05), darkBackgroundColor);


