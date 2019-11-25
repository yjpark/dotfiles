// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:protobuf/protobuf.dart';
import 'package:test/test.dart';

class Message extends GeneratedMessage {
  get info_ => _i;
  static final _i = BuilderInfo("Message")
    ..add(0, null, null, null, null, null, null);
  Message createEmptyInstance() => Message();

  @override
  GeneratedMessage clone() => throw UnimplementedError();
}

main() {
  test('Has no known fields', () {
    expect(Message().info_.fieldInfo, isEmpty);
  });
}
