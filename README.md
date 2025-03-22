# Aconnec Application

1109x project

## Environment
- production
- development

## Folder Structure
```-
.
└── root/
    ├── assets
    ├── lib/
    │   ├── src/
    │   │   ├── features/
    │   │   │   ├── feature1/
    │   │   │   │   ├── data/
    │   │   │   │   │   ├── repositories
    │   │   │   │   │   │    ├── di
    │   │   │   │   │   │    │  ├── repo.(env).dart
    │   │   │   │   │   └── data.repo.dart
    │   │   │   │   ├── model/
    │   │   │   │   │   ├── model.st.dart
    │   │   │   │   ├── service/
    │   │   │   │   │   ├── di/
    │   │   │   │   │   │   ├── service.repo.dart
    │   │   │   │   │   └── service.dart
    │   │   │   │   └── views/
    │   │   │   │       ├── di/
    │   │   │   │       │   ├── view.vm.dart
    │   │   │   │       └── widgets/
    │   │   │   │       │    ├── widget1.dart
    │   │   │   │       │    └── widget2.dart
    │   │   │   │       └── view.dart
    │   │   └── widgets/
    │   │       ├── dialogs/
    │   │       │   ├── dialog1.dart
    │   │       │   └── dialog2.dart
    │   │       ├── widget1.dart
    │   │       └── widget2.dart
    │   ├── constants/
    │   │   │   ├── constant1.dart
    │   │   │   └── constant2.dart
    │   ├── data/
    │   │   │   ├── controller1.dart
    │   │   │   └── controller2.dart
    │   │   ├── gen/
    │   │   │   └── assets.gen.dart
    │   │   ├── middlewares/
    │   │   │   ├── middleware1.dart
    │   │   │   └── middleware2.dart
    │   │   ├── models/
    │   │   │   ├── model1.dart
    │   │   │   ├── model1.freezed.dart
    │   │   │   ├── model1.g.dart
    │   │   │   ├── model2.dart
    │   │   │   ├── model2.freezed.dart
    │   │   │   └── model2.g.dart
    │   │   ├── services/
    │   │   │   ├── service1.dart
    │   │   │   └── service2.dart
    │   │   ├── themes/
    │   │   │   └── theme.dart
    │   │   ├── translations/
    │   │   │   ├── translations.csv
    │   │   │   ├── translations.dart
    │   │   │   └── translations.g.dart
    │   │   └── utils/
    │   │       ├── utils.dart
    │   │       ├── enum.dart
    │   │       └── other...
    │   ├── routes/
    │   │   ├── app_pages.dart
    │   │   └── app_routes.dart
    │   ├── firebase_options_xxx.dart
    │   ├── main_xxx.dart
    │   └── main_app.dart
    ├── analysis_options.yaml
    └── build.yaml
```

## Environment Path
> development = lib/main.development.dart || flavor development
> production = lib/main || flavor production
> pentest root = lib/main.pentest.root.dart || flavor production
> pentest unroot = lib/main.pentest.unroot.dart || flavor production


## How to run 

android
> flutter run -t lib/main.staging.dart --flavor staging
> flutter run -t lib/main.pentest.root.dart --flavor pentest
> flutter run -t lib/main.pentest.unroot.dart --flavor pentest
> flutter run -t lib/main.dart --flavor production

ios
> flutter run -t lib/main.staging.dart --flavor staging
> flutter run -t lib/main.pentest.root.dart --flavor pentest
> flutter run -t lib/main.pentest.unroot.dart --flavor pentest
> flutter run -t lib/main.dart --flavor production

# How to generate transalator

> dart pub global activate intl_utils
> flutter gen-l10n --arb-dir=lib/src/core/translate/l10n --template-arb-file=intl_en.arb

# How to generate asset file 

> fluttergen

# How to generate file

> flutter pub run build_runner build -d

# How to build appbundle , apk & IPA
> flutter build apk {environtment path} --flavor {environment}
> flutter build appbundle {environtment path} --flavor {environment}
> flutter build ipa {environtment path} --flavor {environment}
