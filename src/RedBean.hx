typedef CookieOptions = {
  ?Expires: Int,
  ?MaxAge: Int,
  ?Domain: String,
  ?Path: String,
  ?Secure: Bool,
  ?HttpOnly: Bool,
  ?SameSite: String
}
@:native("_G")
extern class RedBean {
  static var OnHttpRequest: Void -> Void;
  static var OnClientConnection: (ip: Int,port: Int, serverip: Int, serverport: Int) -> Bool;
  static var OnLogLatency: (reqtimeus: Int, contimeus: Int) -> Void;
  static var OnProcessCreate: (pid: Int, ip: Int, port: Int, serverip: Int, serverport: Int) -> Void;
  static var OnProcessDestroy: (pid: Int) -> Void;
  static var OnServerHeartbeat: Void -> Void;
  static var OnServerListen: Void -> Void;
  static var OnServerStart: Void -> Void;
  static var OnServerStop: Void -> Void;
  static var OnWorkerStart: Void -> Void;
  static var OnWorkerStop: Void -> Void;
  static function LaunchBrowser(?path: String): Void;
  static var kLogDebug: Int;
  static var kLogVerbose: Int;
  static var kLogInfo: Int;
  static var kLogWarn: Int;
  static var kLogError: Int;
  static var kLogFatal: Int;

  static function Log(level: Int, message: String): Void;
  
  static function Write(data: String): Void;
  static function SetStatus(code: Int, ?reason: String): Void;
  static function SetHeader(name: String, value: String): Void;
  static function SetCookie(name: String, value: String, ?options: CookieOptions): Void;

  static function DecodeJson(input: String): Dynamic;
  static function EncodeJson(value: Dynamic): String;

  static function __init__(): Void {
    haxe.Log.trace = function(v, ?infos) {
      lua.Lua.print(haxe.Log.formatOutput(v, infos));
    }
  }
}