## Introduction
the easiest way you can add a template for your project
you can customize the template as you wish 

## Getting Started

1. Install Mason

```shell
dart pub global activate mason_cli

```

2. Add mason to your project

```shell
mkdir mason && cd mason && mason init
```
## generate file that contains assets variables and widgets and feature: 

add bricks to mason.yaml file so you can access the files that I have share on Github


```shell
bricks:
    readme:
      git:
        url: https://github.com/YoussefAbdelmonem/mason-templete.git
        path: bricks/readme
    assets:
      git:
        url: https://github.com/YoussefAbdelmonem/mason-templete.git
        path: bricks/assets
    project_template:
      git:
        url: https://github.com/YoussefAbdelmonem/mason-templete.git
        path: bricks/project_template
    feature:
      git:
        url: https://github.com/YoussefAbdelmonem/mason-templete
        path: bricks/feature
    auth:
      git:
        url: https://github.com/YoussefAbdelmonem/mason-templete
        path: bricks/auth

```
## to get the dependecy that you applied
```shell
mason get
```
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
  pinput:
  animate_do:
```
### generate assets folder:
```shell
mason make assets -o ../
```


## generate project template:
```shell
mason make project_template -o .././lib
```

## add new feature with the name you give:
```shell
mason make feature -o .././lib/features
```
## add the default authentications and splash:
```shell
mason make auth -o .././lib/features
```
## add the readme file:
```shell
mason make readme -o ../
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

## generate file that contains assets variables and fonts and json: 

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
  output: lib/core/resources/
  line_length: 80 

  # Optional
  integrations:
    flutter_svg: true
    flare_flutter: true
    rive: true
    lottie: true
```

generate assets folder:

dart run build_runner build

mason make assets -o ../

mason make project_templete -o .././lib

mason make auth -o .././lib/features

mason make feature -o .././lib/features

