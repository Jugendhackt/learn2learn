import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'my_expansion_panel.dart';
export 'my_expansion_panel.dart';

/// A thin wrapper of [ExpansionPanelList] that handles styling and the logic for you and encapsulates it.
/// This is good for re-usability and saves you from the hassle of managing your own [ExpansionPanelList].
class MyExpansionPanelList extends StatefulWidget {
  /// Creates a new [ExpansionPanelList].
  const MyExpansionPanelList({
    required this.children,
    this.boldTitleOnExpanded = true,
    this.canTapOnHeader = true,
    super.key,
  });
  /// The expansion panels to show.
  final List<MyExpansionPanel> children;

  /// Decides whether the title of expanded [ExpansionPanel]s should be bold or not.
  ///
  /// Defaults to true.
  final bool boldTitleOnExpanded;

  /// Whether tapping on the panel's header will expand/collapse it.
  ///
  /// Defaults to true.
  final bool canTapOnHeader;

  @override
  State<MyExpansionPanelList> createState() => _MyExpansionPanelListState();
}

class _MyExpansionPanelListState extends State<MyExpansionPanelList> {
  late List<bool> _isExpanded;

  @override
  void initState(){
    super.initState();
    _isExpanded = List.filled(widget.children.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int i, bool isOpen) {
        setState(() {
          if(!isOpen){
            _isExpanded = List.filled(widget.children.length, false);
          }

          _isExpanded[i] = !isOpen;
        });
      },
      children: widget.children.mapIndexed((index, child) {
        final title = Text(
          child.title,
          style: widget.boldTitleOnExpanded
            ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: _isExpanded[widget.children.indexOf(child)] ? FontWeight.w800 : FontWeight.normal,
              )
            : null,
        );
        return ExpansionPanel(
          canTapOnHeader: widget.canTapOnHeader,
          isExpanded: _isExpanded[widget.children.indexOf(child)],
          headerBuilder: (context, isOpen) => Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            key: child.key,
            child: child.trailing == null
              ? title
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [title, child.trailing!],
                ),
          ),
          body: child.padding == null
            ? child.body
            : Padding(
                padding: child.padding!,
                child: child.body,
              ),
        );
      }).toList(),
    );
  }
}
