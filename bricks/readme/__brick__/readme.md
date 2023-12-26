Short description or introduction of your project.

## Dependencies

Below is a list of default dependencies used in this project:
```yaml
dependencies:
  dio: ^5.2.0
  cached_network_image: ^3.2.3
  shimmer: ^3.0.0
  flutter_svg: ^2.0.7
  easy_localization: ^3.0.2
  smooth_page_indicator: ^1.1.0
  bloc: ^8.1.2
  flutter_bloc: ^8.1.3
  carousel_slider: ^4.2.1
  animated_widgets_flutter: ^1.1.1+2
  get_it: ^7.6.0
  lottie: ^1.3.0
  fluttertoast: ^8.1.2
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  flutter_smart_dialog: ^4.8.2
  responsive_framework: ^1.1.0
  bot_toast: ^4.0.3
```

## generate project template:
```shell
mason make project_template -o .././lib
```

## add new feature
- run this command and then enter feature name 
```shell
mason make feature -o .././lib/features
```

### generate assets folder
```shell
mason make assets -o ../assets
```
## Add assets paths in pubspec.yaml file
```yaml
  assets:
    - assets/images/
    - assets/json/
    - assets/fonts/
    - assets/icons/
    - assets/translations/

```

## generate file that contains assets variables and widgets and injectable: 

1. activate flutter gen 

```shell
dart pub global activate flutter_gen
```

2. add these dependencies to dev_dependencies  

```yaml
dev_dependencies:
  build_runner:
  flutter_gen_runner:
  injectable_generator: 
```

3. add flutter gen configs to pubspec.yaml

```yaml
flutter_gen:
  output: lib/core/resources/gen/
  line_length: 80 

  # Optional
  integrations:
    flutter_svg: true
    flare_flutter: true
    rive: true
    lottie: true
```

4. auto generate files like (injection.config.dart - assets.gen.dart)

```shell
dart run build_runner build
```

## generate file that contains localization keys:

```shell
flutter pub run easy_localization:generate -S "assets/lang" -O "lib/core/resources/gen" -o "locale_keys.g.dart" -f keys
```

