package test;

import helder.Unit.suite;
import helder.Unit.assert;

final MyTest = suite(test -> {
  test('basic boolean checks', () -> {
    assert.ok(true);
    assert.not.ok(false);
  });
  test('basic boolean checks', () -> {
    assert.ok(true);
    assert.not.ok(false);
  });
});