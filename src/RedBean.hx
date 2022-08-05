@:native("_G")
extern class RedBean {
  dynamic static function OnHttpRequest(): Void;
  static function Write(data: String): Void;
  static function LaunchBrowser(?path: String): Void;
}