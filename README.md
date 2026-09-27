# crypter

A multiplatform app that allows to learn how to trade on an exchange.

## Getting Started

This project is a starting point for a Flutter application.

---

## Versioning
* [Flutter](https://github.com/flutter/flutter.git) • 3.44.0 channel stable
* Framework • revision 559ffa3f75e • 2026-05-15
* Tools • Dart 3.12.0

```
$ xcodebuild -version
Xcode 16.3
Build version 16E140
```

---

## Environments

There is an environment ```stage```.

---

## Generating files
Run command:

```
 $ flutter pub run build_runner build
```

## Generating strings
Run command:

```
 $ flutter gen-l10n
```

## Supported platforms
| Web | Android | iOS

## State management
[Reverpod](https://riverpod.dev/docs/introduction/getting_started)

## CI/CD
Deploy is made on GitHub Actions. For Web deploy on Firebase Hosting, for Android on Firebase App Distribution, for iOS on GitHub making archive for simulator.
[GitHub Actions documentation](https://docs.github.com/en/actions)
[Fastlane](https://docs.fastlane.tools/)

## Codestyle

[Effective Dart: Style](https://dart.dev/guides/language/effective-dart/style)

Code is always formatted by using ```dart format lib --line-length 100```

Line length: 100
