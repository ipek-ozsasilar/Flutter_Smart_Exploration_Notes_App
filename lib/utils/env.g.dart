// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: .env
final class _Env {
  static const List<int> _enviedkeyapiBaseUrl = <int>[];

  static const List<int> _envieddataapiBaseUrl = <int>[];

  static final String apiBaseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddataapiBaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddataapiBaseUrl[i] ^ _enviedkeyapiBaseUrl[i]),
  );

  static const List<int> _enviedkeyapiKey = <int>[];

  static const List<int> _envieddataapiKey = <int>[];

  static final String apiKey = String.fromCharCodes(
    List<int>.generate(
      _envieddataapiKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]),
  );

  static const List<int> _enviedkeysentryDsn = <int>[];

  static const List<int> _envieddatasentryDsn = <int>[];

  static final String sentryDsn = String.fromCharCodes(
    List<int>.generate(
      _envieddatasentryDsn.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasentryDsn[i] ^ _enviedkeysentryDsn[i]),
  );

  static const List<int> _enviedkeycrashlyticsEnabled = <int>[
    607173942,
    2099284265,
    2218589079,
    2013855658,
  ];

  static const List<int> _envieddatacrashlyticsEnabled = <int>[
    607173954,
    2099284315,
    2218589154,
    2013855695,
  ];

  static final String crashlyticsEnabled = String.fromCharCodes(
    List<int>.generate(
      _envieddatacrashlyticsEnabled.length,
      (int i) => i,
      growable: false,
    ).map(
      (int i) =>
          _envieddatacrashlyticsEnabled[i] ^ _enviedkeycrashlyticsEnabled[i],
    ),
  );
}
