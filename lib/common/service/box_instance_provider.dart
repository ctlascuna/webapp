import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boxInstanceProvider = Provider<Box<dynamic>>(
  (_) => throw UnimplementedError(),
);
