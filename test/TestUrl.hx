package test;

import RedBean.*;
import helder.Unit.suite;
import helder.Unit.assert;

final TestUrl = suite(test -> {
  test('parse url', () -> {
    final result = ParseUrl('https://httpbin.org/anything');
    assert.is(result.scheme, 'https');
    assert.is(result.host, 'httpbin.org');
    assert.is(result.path, '/anything');
  });
});