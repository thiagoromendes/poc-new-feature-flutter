import 'package:flutter/material.dart';
import 'package:poc_new_feature/src/version_control/version_control.dart';

class AppCard extends StatefulWidget {
  final String? id;
  final String label;
  final String? tag;
  final Color? tagColor;
  final VoidCallback? actionPrimary;
  final Icon? iconLeft;
  final double? positionLeft;
  final double? positionRight;
  final double? positionTop;
  final double? positionBottom;

  const AppCard({
    Key? key,
    this.id,
    required this.label,
    this.tag,
    this.tagColor,
    this.actionPrimary,
    this.iconLeft,
    this.positionLeft,
    this.positionRight,
    this.positionTop,
    this.positionBottom,
  }) : super(key: key);

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  final VersionControl versionControl = VersionControl();
  bool isNewFeature = false;

  void testNewFeature() async {
    bool result = await versionControl.hasNewFeature(widget.id!);
    setState(() {
      isNewFeature = result;
    });
  }

  void actions() {
    versionControl.removeItemList(widget.id!);
    if (widget.actionPrimary != null) widget.actionPrimary!();
  }

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      testNewFeature();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        child: ListTile(
          leading: widget.iconLeft,
          title: Text(
            widget.label,
            style: const TextStyle(color: Colors.blueGrey),
          ),
          //(Icons.more_vert),
          onTap: isNewFeature ? actions : widget.actionPrimary ?? () {},
        ),
      ),
      if (widget.tag != null && isNewFeature)
        Positioned(
          left: widget.positionLeft,
          right: widget.positionRight,
          top: widget.positionTop,
          bottom: widget.positionBottom ?? 30,
          child: Container(
            decoration: BoxDecoration(
                color: widget.tagColor ?? Colors.lightBlueAccent,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.tag!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        )
    ]);
  }
}
