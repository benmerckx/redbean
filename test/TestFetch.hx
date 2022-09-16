package test;

import haxe.Json;
import RedBean.*;
import helder.Unit.suite;
import helder.Unit.assert;

final TestFetch = suite(test -> {
  test('simple get', () -> {
    final result = Fetch('https://httpbin.org/anything');
    assert.is(result.status, 200);
  });

  test('set headers', () -> {
    final result = Fetch('https://httpbin.org/anything', {
      headers: {
        'X-Test': 'test'
      }
    });
    assert.is(result.status, 200);
    final response: Dynamic = Json.parse(result.body);
    assert.is(Reflect.field(response.headers, 'X-Test'), 'test');
  });
});