abstract class IntRoutes {
  static const letterDraw = 'letter-draw';
  static const gapComplete = 'gap-complete';
  static const imageWordMatch = 'image-word-match';

  static const settings = 'settings';
}

abstract class Routes {
  static const home = '/';
  static const login = '/login';

  static const gapComplete = '/${IntRoutes.gapComplete}';
  static const letterDraw = '/${IntRoutes.letterDraw}';
  static const imageWordMatch = '/${IntRoutes.imageWordMatch}';

  static const settings = '/${IntRoutes.settings}';
}
