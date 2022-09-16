package test;

import helder.Unit.suite;
import helder.Unit.assert;
import haxe.Json;

final TestJson = suite(test -> {
  test('parse primitives', () -> {
    assert.is(Json.parse('1'), 1);
    assert.is(Json.parse('true'), true);
    assert.is(Json.parse('false'), false);
    assert.is(Json.parse('null'), null);
    assert.is(Json.parse('"string"'), 'string');
  });

  test('parse object', () -> {
    assert.equal(Json.parse('{"a": true}'), {a: true});
  });

  test('parse arrays', () -> {
    assert.equal(Json.parse('[0, 1, 2]'), [0, 1, 2]);
  });

  test('parse nested', () -> {
    assert.equal(Json.parse('{"a": [0, 1, 2]}'), {a: [0, 1, 2]});
  });
});