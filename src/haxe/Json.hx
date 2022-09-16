package haxe;

@:coreApi
class Json {
  public static function parse(text:String):Dynamic {
    return convertAfterDecode(RedBean.DecodeJson(text));
  }

  public static function stringify(value:Dynamic, ?replacer:(key:Dynamic, value:Dynamic) -> Dynamic, ?space:String):String {
    return RedBean.EncodeJson(value);
  }

  static function convertAfterDecode(value:Dynamic):Dynamic {
    if (lua.Lua.type(value) == 'table') {
      try {
        if (value[1] != null) {
          return [
            for (item in lua.PairTools.ipairsIterator(value))
              convertAfterDecode(item.value)
          ];
        }
      } catch (e) {}
      final res: haxe.DynamicAccess<Dynamic> = lua.Boot.tableToObject(value);
      for (i => v in res) res[i] = convertAfterDecode(v);
      return res;
    }
		return value;
	}
}