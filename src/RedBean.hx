import haxe.DynamicAccess;

typedef CookieOptions = {
  ?Expires: Int,
  ?MaxAge: Int,
  ?Domain: String,
  ?Path: String,
  ?Secure: Bool,
  ?HttpOnly: Bool,
  ?SameSite: String
}

typedef FetchOptions = {
  ?method: String,
  ?body: String,
  ?followredirects: Bool,
  ?maxredirects: Int,
  ?headers: Dynamic
}

@:multiReturn extern class FetchResult {
  var status: Null<Int>;
  var headers: Null<Dynamic>;
  var body: Null<String>;
}

@:multiReturn extern class Addr {
  var ip: Int;
  var port: Int;
}

@:multiReturn extern class ResponseBody {
  var body: Null<String>;
  var error: Null<String>;
}

@:multiReturn extern class Result<T, E> {
  var result: Null<T>;
  var error: Null<E>; 
}

typedef URL = {
  var scheme: String;
  var user: String;
  var pass: String;
  var host: String;
  var port: Int;
  var path: String;
  var params: DynamicAccess<String>;
  var fragment: String;
}

typedef BenchmarkResult = {
  var nanos: Int;
  var ticks: Int;
  @:native('overhead-ticks')
  var overheadTicks: Int;
  var tries: Int;
}

@:native("_G")
extern class RedBean {
  // globals
  static var arg: Array<String>;

  // hooks
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

  // functions
  static function Write(data: String): Void;
  static function SetStatus(code: Int, ?reason: String): Void;
  static function SetHeader(name: String, value: String): Void;
  static function SetCookie(name: String, value: String, ?options: CookieOptions): Void;
  static function GetParam(name: String): Void;
  static function EscapeHtml(html: String): String;
  static function LaunchBrowser(?path: String): Void;
  static function CategorizeIp(ip: Int): String;
  static function DecodeBase64(ascii: String): String;
  static function DecodeLatin1(iso_8859_1: String): String;
  static function EncodeBase64(binary: String): String;
  static function DecodeJson(input: String): Dynamic;
  static function EncodeJson(value: Dynamic): String;
  static function EncodeLua(value: Dynamic): Dynamic;
  static function EncodeLatin1(utf8: String, ?flags: Int): String;
  static function EscapeFragment(str: String): String;
  static function EscapeHost(str: String): String;
  static function EscapeLiteral(str: String): String;
  static function EscapeParam(str: String): String;
  static function EscapePass(str: String): String;
  static function EscapePath(str: String): String;
  static function EscapeSegment(str: String): String;
  static function EscapeUser(str: String): String;
  static function EvadeDragnetSurveillance(evade: Bool): Void;
  static function Fetch(url:String, ?options: FetchOptions): FetchResult;
  static function FormatHttpDateTime(seconds: String): String;
  static function FormatIp(ip: Int): String;
  static function GetRemoteAddr(): Addr;
  static function GetResponseBody(): ResponseBody;
  static function GetClientAddr(): Addr;
  static function GetServerAddr(): Addr;
  static function GetDate(): Int;
  static function GetHeader(name: String): Null<String>;
  static function GetHeaders(name: String): DynamicAccess<String>;
  static function GetLogLevel(): Int;
  static function GetHost(): String;
  static function GetHostOs(): String;
  static function GetMonospaceWidth(char: String): Int;
  static function GetMethod(): String;
  static function GetParams(): Dynamic;
  static function GetPath(): String;
  static function GetEffectivePath(): String;
  static function GetScheme(): String;
  static function GetPayload(): String;
  static function GetStatus(): Int;
  static function GetTime(): Int;
  static function GetUrl(): String;
  static function GetHttpVersion(): Int;
  static function GetHttpReason(code: Int): String;
  static function GetRandomBytes(?length: Int): String;
  static function GetRedbeanVersion(): Int;
  static function GetZipPaths(?prefix: String): DynamicAccess<String>;
  static function HasParam(name: String): Bool;
  static function HidePath(prefix: String): Void;
  static function IsHiddenPath(path: String): Void;
  static function IsPublicIp(ip: Int): Bool;
  static function IsPrivateIp(ip: Int): Bool;
  static function IsLoopbackClient(): Bool;
  static function IsAssetCompressed(path: String): Bool;
  static function IndentLines(str: String, ?amount: Int): String;
  static function LoadAsset(path: String): String;
  static function StoreAsset(path: String, data: String, ?mode: Int): Void;
  static var kLogDebug: Int;
  static var kLogVerbose: Int;
  static var kLogInfo: Int;
  static var kLogWarn: Int;
  static var kLogError: Int;
  static var kLogFatal: Int;
  static function Log(level: Int, message: String): Void;
  static function ParseHttpDateTime(rfc1123: String): Int;
  static function ParseUrl(url: String): URL;
  static function IsAcceptablePath(path: String): Bool;
  static function IsReasonablePath(path: String): Bool;
  static function EncodeUrl(url: URL): String;
  static function ParseIp(str: String): Int;
  static function GetAssetComment(path: String): String;
  static function GetAssetLastModifiedTime(path: String): Int;
  static function GetAssetMode(path: String): Int;
  static function GetAssetSize(path: String): Int;
  static function GetBody(): String;
  static function GetCookie(name: String): String;
  static function Md5(str: String): String;
  static function Sha1(str: String): String;
  static function Sha224(str: String): String;
  static function Sha256(str: String): String;
  static function Sha384(str: String): String;
  static function Sha512(str: String): String;
  static function GetCryptoHash(name: String, payload: String, ?key: String): String;
  static function IsDaemon(): Bool;
  @:overload(function(str: String): Void {})
  static function ProgramAddr(ip: Int): Void;
  static function ProgramGid(int: Int): Void;
  static function ProgramDirectory(str: String): Void;
  static function ProgramLogMessages(bool: Bool): Void;
  static function ProgramLogBodies(bool: Bool): Void;
  static function ProgramLogPath(bool: Bool): Void;
  static function ProgramPidPath(str: String): Void;
  static function ProgramUniprocess(?bool: Bool): Bool;
  static function Slurp(filename: String, ?i: Int, ?j: Int): Result<String, Int>;
  static function Barf(filename: String, data: String, ?mode: Int, ?flags: Int, ?offset: Int): Result<Bool, Int>;
  static function ProgramContentType(ext: String, ?contenttype: String): String;
  static function ProgramHeader(name: String, value: String): Void;
  static function ProgramHeartbeatInterval(?milliseconds: Int): Void;
  static function ProgramTimeout(milliseconds: Int): Void;
  static function ProgramSslTicketLifetime(seconds: Int): Void;
  static function ProgramBrand(str: String): Void;
  static function ProgramCache(seconds: Int): Void;
  static function ProgramPort(uInt16: Int): Void;
  static function ProgramMaxPayloadSize(int: Int): Void;
  static function ProgramRedirect(code: Int,src: String, location: String): Void;
  static function ProgramCertificate(pem: String): Void;
  static function ProgramMaxWorkers(int: Int): Void;
  static function ProgramPrivateKey(pem: String): Void;
  static function ProgramSslPresharedKey(key: String, identity: String): Void;
  static function ProgramSslFetchVerify(enabled: Bool): Void;
  static function ProgramSslClientVerify(enabled: Bool): Void;
  static function ProgramSslRequired(mandatory: String): Void;
  static function ProgramSslCiphersuite(name: String): Void;
  static function Route(?host: String, ?path: String): Void;
  static function Sleep(seconds: Float): Void;
  static function RouteHost(?host: String, ?path: String): Bool;
  static function RoutePath(?path: String): Bool;
  static function ServeAsset(path: String): Void;
  static function ServeError(code: Int, ?reason: String): Void;
  static function SetLogLevel(level: Int): Void;
  static function VisualizeControlCodes(str: String): String;
  static function Underlong(str: String): String;
  static function Bsf(x: Int): Int;
  static function Bsr(x: Int): Int;
  static function Crc32(initial: Int,data: String): Int;
  static function Crc32c(initial: Int,data: String): Int;
  static function Popcnt(x: Int): Int;
  static function Rdtsc(): Int;
  static function Lemur64(): Int;
  static function Rand64(): Int;
  static function Rdrand(): Int;
  static function Rdseed(): Int;
  static function GetCpuCount(): Int;
  static function GetCpuCore(): Int;
  static function GetCpuNode(): Int;
  static function Decimate(str: String): String;
  static function MeasureEntropy(data: String): Float;
  static function Deflate(uncompressed: String, ?level: Int): Result<String, String>;
  static function Inflate(compressed: String, maxoutsize: Int): Result<String, String>;
  static function Benchmark(func: Void->Void, ?count: Int, ?maxattempts: Int): BenchmarkResult;
  static function oct(int: Int): String;
  static function hex(int: Int): String;
  static function bin(int: Int): String;
  static function ResolveIp(hostname: String): Result<Int, String>;

  static function __init__(): Void {
    haxe.Log.trace = function(v, ?infos) {
      lua.Lua.print(haxe.Log.formatOutput(v, infos));
    }
  }
}