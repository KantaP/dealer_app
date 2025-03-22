import 'package:aconnec_1109_x/src/features/dashboard/bindings/dasboard.binding.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RequestFormView extends StatelessWidget {
  const RequestFormView(
      {super.key, required this.formUrl, required this.title});

  final String title;
  final String formUrl;

  @override
  Widget build(BuildContext context) {
    final vm = DashboardBinding.requestFormViewModel;
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            // print(progress);
            vm.progressSubject.setValue(progress);
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(formUrl.trim()));
    return Stack(
      children: [
        DefaultLayout(
          // bodyPadding: PaddingScreen.paddingLTR,
          appBar: DefaultAppBar(
            title: title,
            centerTitle: true,
          ),
          slivers: [
            SliverFillRemaining(
              child: WebViewWidget(controller: controller),
            )
          ],
          physics: const NeverScrollableScrollPhysics(),
          extendBody: true,
        ),
        CustomStreamBuilder(
          stream: vm.progressSubject.subject,
          builder: (_, snapshot) => Visibility(
            visible: snapshot.data == 100 ? false : true,
            child: const Loading(),
          ),
        )
      ],
    );
  }
}
