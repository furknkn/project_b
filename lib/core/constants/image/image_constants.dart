class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get getLogo => toImagePng('logo');

  String toImagePng(String name) => 'assets/images/$name.png';
}
