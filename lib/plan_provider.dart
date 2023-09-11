import 'package:flutter/material.dart';
import './models/data_layer.dart';

class PlanProvider extends InheritedWidget {
  final _plan = Plan();
  PlanProvider({super.key, required this.child}) : super(child: child);

  @override
  final Widget child;

  static PlanProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PlanProvider>();
  }

  @override
  bool updateShouldNotify(PlanProvider oldWidget) {
    return true;
  }
}

Plan of(BuildContext context) {
  final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
  return provider!._plan;
}
