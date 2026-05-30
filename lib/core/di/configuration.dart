import 'package:crypter/core/di/configuration.config.dart';
import 'package:crypter/core/di/locator.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: r'$configure', preferRelativeImports: true, asExtension: false)
Future<GetIt> configureDependencies() async => $configure(locator);
