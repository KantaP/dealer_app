import 'package:flutter/widgets.dart';

class CustomStreamBuilder<T> extends StatelessWidget {
  const CustomStreamBuilder({
    super.key,
    required this.stream,
    required this.builder,
    this.silver = false,
  });

  final Stream<T> stream;
  final Widget Function(BuildContext context, AsyncSnapshot<T>) builder;
  final bool silver;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (_, snapshot) {
        if (snapshot.hasData == false) return emptyState();
        if (snapshot.hasData) {
          if (snapshot.data == null) return emptyState();
          return builder(context, snapshot);
        }
        if (snapshot.hasError) {
          return emptyState();
        }
        return emptyState();
      },
    );
  }

  Widget emptyState() {
    if (silver) {
      return const SliverToBoxAdapter();
    }
    return Container();
  }
}
