import 'package:flutter/widgets.dart';

// Using InheritedWidget to provide page size configurable per subtree, so different feed config along the app
/// Scoped configuration for the feed feature, passed down the widget tree
/// via Flutter's [InheritedWidget] mechanism.
class FeedConfig extends InheritedWidget {
  final int pageSize;

  const FeedConfig({
    super.key,
    required this.pageSize,
    required super.child,
  });

  static FeedConfig of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<FeedConfig>();
    assert(result != null, 'No FeedConfig found in widget tree. Wrap your HomeScreen with a FeedConfig widget.');
    return result!;
  }

  @override
  bool updateShouldNotify(FeedConfig oldWidget) {
    return pageSize != oldWidget.pageSize;
  }
}