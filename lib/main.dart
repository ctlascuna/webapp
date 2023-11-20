import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:webapp/app.dart';
import 'package:webapp/common/service/services.dart';

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

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBnhOzeJtM6avExPsJ1Q0-NAebv00W2Q1Y",
      authDomain: "portfolio-873a4.firebaseapp.com",
      projectId: "portfolio-873a4",
      storageBucket: "portfolio-873a4.appspot.com",
      messagingSenderId: "724209800135",
      appId: "1:724209800135:web:44945f237b7a421ac9bfe2",
      measurementId: "G-1BM5B099HB",
    ),
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const Portal(child: App()),
    ),
  );
}
