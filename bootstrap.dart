// bootstrap.dart (proje kök dizininde)
import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty) {
    print('Kullanım: dart bootstrap.dart [komut]');
    print('\nMevcut komutlar:');
    print('  all          - Tüm adımları sırayla çalıştır');
    print('  pin_flutter  - Flutter versiyonunu sabitle');
    print('  dependencies - Paketleri ekle');
    print('  files        - Konfigürasyon dosyalarını oluştur');
    print('  structure    - Klasör yapısını oluştur');
    print('  generate     - Code generation çalıştır');
    print('  clean        - Flutter clean');
    print('  reset        - Clean + pub get');
    print('  build_apk    - APK oluştur');
    return;
  }

  final command = args[0];

  switch (command) {
    case 'all':
      await pinFlutter();
      await addDependencies();
      await writeFiles();
      await createStructure();
      await generate();
      print('\n✅ Bootstrap tamamlandı!');
      break;
    case 'pin_flutter':
      await pinFlutter();
      break;
    case 'dependencies':
      await addDependencies();
      break;
    case 'files':
      await writeFiles();
      break;
    case 'structure':
      await createStructure();
      break;
    case 'generate':
      await generate();
      break;
    case 'clean':
      await clean();
      break;
    case 'reset':
      await reset();
      break;
    case 'build_apk':
      await buildApk();
      break;
    default:
      print('❌ Bilinmeyen komut: $command');
  }
}

Future<void> pinFlutter() async {
  print('\n📌 Flutter stable versiyonu sabitleniyor...');

  // Sidekick dene
  await runCommand('dart', ['pub', 'global', 'activate', 'sidekick']);
  await runCommand('sidekick', ['use', 'stable']);

  // FVM dene (fallback)
  await runCommand('dart', ['pub', 'global', 'activate', 'fvm']);
  await runCommand('fvm', ['use', 'stable', '--force']);

  print('✅ Flutter versiyonu sabitlendi');
}

Future<void> addDependencies() async {
  print('\n📦 Paketler yükleniyor...');

  final dependencies = [
    'get_it',
    'json_annotation',
    'equatable',
    'kartal',
    'responsive_framework',
    'envied',
    'logger',
    'firebase_core',
    'cloud_firestore',
    'firebase_ui_auth',
    'firebase_auth',
    'firebase_storage',
  ];

  final devDependencies = [
    'build_runner',
    'json_serializable',
    'envied_generator',
    'flutter_lints',
    'very_good_analysis',
    'flutter_gen_runner',
  ];

  for (var package in dependencies) {
    print('  → $package');
    await runCommand('flutter', ['pub', 'add', package]);
  }

  for (var package in devDependencies) {
    print('  → $package (dev)');
    await runCommand('flutter', ['pub', 'add', '--dev', package]);
  }

  await runCommand('flutter', ['pub', 'get']);
  print('✅ Paketler eklendi');
}

Future<void> writeFiles() async {
  print('\n📝 Konfigürasyon dosyaları oluşturuluyor...');

  // analysis_options.yaml
  await File('analysis_options.yaml').writeAsString('''
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    always_declare_return_types: true
    always_put_required_named_parameters_first: true
    always_require_non_null_named_parameters: true
    always_use_package_imports: true
    avoid_empty_else: true
    avoid_print: true
    prefer_final_locals: true
    sort_constructors_first: true
    use_super_parameters: true
''');
  print('  ✓ analysis_options.yaml');

  // build.yaml
  await File('build.yaml').writeAsString('''
targets:
  \$default:
    builders:
      json_serializable:
        generate_for:
          - lib/models/**_model.dart
''');
  print('  ✓ build.yaml');

  // flutter_gen.yaml
  await File('flutter_gen.yaml').writeAsString('''
integrations:
  flutter_svg: true
line_length: 100
outputs:
  class_name: Assets
  package_parameter_enabled: false
''');
  print('  ✓ flutter_gen.yaml');

  // .env
  await File('.env').writeAsString('''
API_BASE_URL=
API_KEY=
SENTRY_DSN=
CRASHLYTICS_ENABLED=true
''');
  print('  ✓ .env');

  // .env.example
  await File('.env.example').writeAsString('''
API_BASE_URL=https://api.example.com
API_KEY=replace_me
SENTRY_DSN=
CRASHLYTICS_ENABLED=true
''');
  print('  ✓ .env.example');

  // .gitignore güncellemesi
  final gitignore = File('.gitignore');
  if (await gitignore.exists()) {
    final content = await gitignore.readAsString();
    if (!content.contains('.env')) {
      await gitignore.writeAsString(
        '$content\n\n# Env files\n.env\n.env.*\n',
        mode: FileMode.append,
      );
      print('  ✓ .gitignore güncellendi');
    }
  }

  print('✅ Konfigürasyon dosyaları oluşturuldu');
}

Future<void> createStructure() async {
  print('\n📁 Klasör yapısı oluşturuluyor...');

  // Klasörleri oluştur
  final directories = [
    'lib/features',
    'lib/models',
    'lib/constants',
    'lib/enums',
    'lib/service_locator',
    'lib/provider',
    'lib/view_model',
    'lib/utils',
    'lib/widgets',
    'assets/images',
    'assets/icons',
    'assets/colors',
    'assets/fonts',
    'gen',
  ];

  for (var dir in directories) {
    await Directory(dir).create(recursive: true);
    print('  ✓ $dir');
  }

  // service_locator.dart
  await File('lib/service_locator/service_locator.dart').writeAsString('''
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Servislerinizi burada kaydedin
}
''');
  print('  ✓ service_locator.dart');

  // main.dart
  await File('lib/main.dart').writeAsString('''
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'service_locator/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Exploration Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: const [
          Breakpoint(start: 0, end: 450, name: MOBILE),
          Breakpoint(start: 451, end: 800, name: TABLET),
          Breakpoint(start: 801, end: 1200, name: DESKTOP),
          Breakpoint(start: 1201, end: double.infinity, name: '4K'),
        ],
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Bootstrap OK ✅',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
''');
  print('  ✓ main.dart');

  // env.dart
  await File('lib/utils/env.dart').writeAsString('''
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'API_BASE_URL')
  static const String apiBaseUrl = _Env.apiBaseUrl;

  @EnviedField(varName: 'API_KEY')
  static const String apiKey = _Env.apiKey;

  @EnviedField(varName: 'SENTRY_DSN', defaultValue: '')
  static const String sentryDsn = _Env.sentryDsn;

  @EnviedField(varName: 'CRASHLYTICS_ENABLED', defaultValue: 'true')
  static const String crashlyticsEnabled = _Env.crashlyticsEnabled;
}
''');
  print('  ✓ env.dart');

  print('✅ Klasör yapısı oluşturuldu');
}

Future<void> generate() async {
  print('\n⚙️ Code generation çalıştırılıyor...');

  await runCommand('flutter', ['pub', 'get']);
  await runCommand('dart', [
    'run',
    'build_runner',
    'build',
    '--delete-conflicting-outputs',
  ]);

  print('✅ Code generation tamamlandı');
}

Future<void> clean() async {
  print('\n🧹 Flutter clean...');
  await runCommand('flutter', ['clean']);
  print('✅ Clean tamamlandı');
}

Future<void> reset() async {
  print('\n🔄 Reset işlemi başlatılıyor...');
  await clean();
  await runCommand('flutter', ['pub', 'get']);
  print('✅ Reset tamamlandı');
}

Future<void> buildApk() async {
  print('\n🔨 APK oluşturuluyor...');
  await runCommand('flutter', ['build', 'apk']);
  print('✅ APK oluşturuldu');
}

// Yardımcı fonksiyon - komutları çalıştır
Future<void> runCommand(String executable, List<String> arguments) async {
  try {
    final result = await Process.run(executable, arguments, runInShell: true);

    if (result.stdout.toString().isNotEmpty) {
      stdout.write(result.stdout);
    }

    if (result.stderr.toString().isNotEmpty) {
      stderr.write(result.stderr);
    }
  } catch (e) {
    print('⚠️ Komut çalıştırılamadı: $executable ${arguments.join(' ')}');
    print('   Hata: $e');
  }
}
