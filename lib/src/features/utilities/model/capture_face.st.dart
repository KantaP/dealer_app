import 'dart:io';

import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class CaptureFacePageState implements IPageState<CaptureFacePageState> {
  bool _isLoading = false;
  bool _initCamera = false;
  Function()? _onCapture;
  bool _canRetake = false;
  File? _previewFile;

  CaptureFacePageState({
    bool isLoading = false,
    bool initCamera = false,
    Function()? onCapture,
    File? previewFile,
    bool canRetake = false,
  }) {
    _isLoading = isLoading;
    _initCamera = initCamera;
    _onCapture = onCapture;
    _previewFile = previewFile;
    _canRetake = canRetake;
  }

  bool get isLoading => _isLoading;
  bool get initCamera => _initCamera;
  Function()? get onCapture => _onCapture;
  File? get previewFile => _previewFile;
  bool get canRetake => _canRetake;

  @override
  CaptureFacePageState copyWith(Map<String, dynamic> value) {
    return CaptureFacePageState(
      isLoading: value[CaptureFacePageStateFields.isLoading] ?? _isLoading,
      initCamera: value[CaptureFacePageStateFields.initCamera] ?? _initCamera,
      onCapture: value[CaptureFacePageStateFields.onCapture] ?? _onCapture,
      previewFile:
          value[CaptureFacePageStateFields.previewFile] ?? _previewFile,
      canRetake: value[CaptureFacePageStateFields.canRetake] ?? _canRetake,
    );
  }
}

class CaptureFacePageStateFields {
  CaptureFacePageStateFields._();

  static const String isLoading = 'isLoading';
  static const String initCamera = 'initCamera';
  static const String onCapture = 'onCapture';
  static const String previewFile = 'previewFile';
  static const String canRetake = 'canRetake';
}
