import 'package:flutter/material.dart';

/// Use this data class instead of [ExpansionPanel] if you use [MyExpansionPanelList].
/// The idea here is to create a component that encapsulates completely the styling
/// and logic of the [ExpansionPanel] which makes it easy to reuse.
class MyExpansionPanel {
  /// Creates an expansion panel to be used as a child for [ExpansionPanelList].
  const MyExpansionPanel({
    required this.title,
    required this.body,
    this.trailing,
    this.padding,
    this.key,
  });
  /// The title of this [ExpansionPanel].
  final String title;

  /// An optional widget which is displayed next to the title-
  final Widget? trailing;

  /// The body of this [ExpansionPanel].
  final Widget body;

  /// An optional [Key].
  final Key? key;

  /// Optional padding.
  final EdgeInsets? padding;
}
