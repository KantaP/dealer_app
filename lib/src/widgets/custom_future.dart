import 'package:aconnec_1109_x/src/widgets/loading/placeholder.dart';
import 'package:flutter/material.dart';

class CustomFuture<T> extends StatefulWidget {
  const CustomFuture({
    super.key,
    required this.future,
    required this.builder,
    this.customLoading,
    this.customError,
  });

  final Future<T> future;
  final Widget Function(BuildContext context, AsyncSnapshot<T>) builder;
  final Widget? customLoading;
  final Widget? customError;

  @override
  State<CustomFuture<T>> createState() => _CustomFutureState<T>();
}

class _CustomFutureState<T> extends State<CustomFuture<T>> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      key: UniqueKey(),
      future: Future.delayed(const Duration(seconds: 1), () => widget.future),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            if (widget.customLoading != null) return widget.customLoading!;
            return const ContentPlaceholder(
              lineType: ContentLineType.twoLines,
            );
          default:
            if (snapshot.hasError) {
              if (widget.customError != null) return widget.customError!;
              print(snapshot.error);
              return InkWell(
                onTap: () {
                  setState(() {});
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh),
                    Text('Failed to fetch data.'),
                  ],
                ),
              );
            } else {
              return widget.builder(context, snapshot);
            }
        }
      },
    );
  }
}
