import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAnimatedList extends StatefulWidget {
  final List<Widget> children;
  final double spacerHeight;
  final ScrollController? scrollController;
  final GlobalKey<AnimatedListState> listKey;
  final EdgeInsets? padding;

  const CustomAnimatedList(
      {required this.children,
      required this.listKey,
      this.padding,
      super.key,
      this.spacerHeight = 12,
      this.scrollController});

  @override
  State<CustomAnimatedList> createState() => CustomAnimatedListState();
}

class CustomAnimatedListState extends State<CustomAnimatedList>with WidgetsBindingObserver {
  List<Widget> toRenderChildren = [];

  @override
  void initState() {
    toRenderChildren.add(SizedBox(
      height: widget.spacerHeight,
    ));
    widget.listKey.currentState?.insertItem(0);

    addItems(widget.children);
    super.initState();
  }

  void addItems(final List<Widget> toAddWidgets) {
    toRenderChildren=[];
    var future = Future(() {});
    for (Widget child in toAddWidgets) {
      future = future.then((final _) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          toRenderChildren.add(child);
          toRenderChildren.add(SizedBox(
            height: widget.spacerHeight,
          ));
          widget.listKey.currentState?.insertItem(toRenderChildren.length - 2);
          widget.listKey.currentState?.insertItem(toRenderChildren.length - 1);
        });
      });
    }
  }
  @override
  void didUpdateWidget(covariant final CustomAnimatedList oldWidget) {
    toRenderChildren=[];
    addItems(widget.children);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(final BuildContext context) {
    return AnimatedList(
      physics: const AlwaysScrollableScrollPhysics(),
      key: widget.listKey,
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 8.w),
      initialItemCount: toRenderChildren.length,
      controller: widget.scrollController,
      itemBuilder: (final context, final index, final animation) => FadeTransition(
    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
    child:SlideTransition(
          position: CurvedAnimation(
            curve: Curves.linear,
            parent: animation,
          ).drive((Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero))),
          child: toRenderChildren[index],
        ),
    ));
  }
}
