import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/select_item.st.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/select_item.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class SelectItemView extends CustomView<SelectItemViewModel> {
  const SelectItemView({required SelectItemViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _SelectItemViewState createState() => _SelectItemViewState(viewModel);
}

class _SelectItemViewState
    extends ViewState<SelectItemView, SelectItemViewModel> {
  _SelectItemViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.rotues);
  }

  @override
  void didPush() {
    super.didPush();
    final settings = ModalRoute.of(context)?.settings;
    final arguments = settings?.arguments as Map<String, dynamic>? ?? {};
    viewModel.updateState(<String, dynamic>{
      SelectItemPageFields.pageTitle: arguments[SelectItemPageFields.pageTitle],
      SelectItemPageFields.items: arguments[SelectItemPageFields.items],
      SelectItemPageFields.onSelect: arguments[SelectItemPageFields.onSelect],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 32.0),
          child: CustomScrollView(
            primary: false,
            slivers: [
              SliverToBoxAdapter(
                child: StreamBuilder<SelectItemPageState>(
                  stream: viewModel.state,
                  builder: (context, snapshot) {
                    return HilightText(
                      text: snapshot.data?.pageTitle ?? '',
                      hilightStyle:
                          Theme.of(context).textTheme.headlineSmall?.merge(
                                const TextStyle(
                                    color: blueColor,
                                    fontWeight: FontWeight.bold),
                              ),
                      normalStyle: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTextField(
                  label: '',
                  prefixIcon: const Icon(Icons.search),
                  placeholder: S.of(context).searchPlaeholder,
                  onChanged: (text) {
                    viewModel.updateState(<String, dynamic>{
                      SelectItemPageFields.searchText: text
                    });
                  },
                ),
              ),
              SliverFillRemaining(
                child: StreamBuilder<SelectItemPageState>(
                  stream: viewModel.state,
                  builder: (context, snapshot) {
                    final filterItems = snapshot.data?.items
                        .where((e) =>
                            e.title.contains(snapshot.data?.searchText ?? ''))
                        .toList();
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: filterItems?.length ?? 0,
                      itemBuilder: (context, index) {
                        if (filterItems?[index] != null) {
                          return radioBox(filterItems![index]);
                        }
                        return Container();
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget radioBox(SelectItem e) {
    return Row(
      children: [
        StreamBuilder<SelectItemPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              return Radio<SelectItem>(
                value: e,
                groupValue: snapshot.data?.selectedItem,
                onChanged: (value) {
                  viewModel.updateState(<String, dynamic>{
                    SelectItemPageFields.selectedItem: value
                  });

                  if (snapshot.data?.onSelect != null) {
                    snapshot.data?.onSelect!(value!);
                    viewModel.onBack();
                  }
                },
                activeColor: blueColor,
              );
            }),
        Expanded(
          child: Text(
            e.title,
            softWrap: true,
          ),
        )
      ],
    );
  }
}
