import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:webapp/app.dart';
import 'package:webapp/common/service/services.dart';
import 'package:webapp/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  final localBox = await Hive.openBox<dynamic>('local-box');

  final container = ProviderContainer(
    overrides: [boxInstanceProvider.overrideWithValue(localBox)],
  );

  final token =
      await container.read(secureStorageServiceProvider.notifier).getToken();
  container.read(graphQLService.notifier).updateBearerToken(token ?? '');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const Portal(child: App()),
    ),
  );
}
