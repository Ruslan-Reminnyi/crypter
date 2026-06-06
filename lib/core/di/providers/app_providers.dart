import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/data/remote/endpoints.dart';
import 'package:crypter/domain/repositories/crypto_info_repo.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:crypter/data/repositories/binance_crypto_info_repo.dart';
import 'package:crypter/data/services/remote/binance_web_socket_service.dart';
import 'package:crypter/domain/services/remote/web_socket_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypter/core/di/constants.dart';
import 'package:dio/dio.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:crypter/data/services/local/shared_preferences_service.dart';

part 'app_providers.g.dart';

part 'crypto_info_repo_provider.dart';
part 'web_socket_service_provider.dart';
part 'shared_preferences_provider.dart';
part 'config_providers.dart';
part 'behaviour_subject_provider.dart';
part 'dio_provider.dart';
part 'web_socket_provider.dart';
part 'shared_preferences_service_provider.dart';
