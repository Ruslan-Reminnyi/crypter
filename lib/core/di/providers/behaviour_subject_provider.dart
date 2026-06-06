part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
BehaviorSubject<List<Candle>> behaviourSubject(Ref _) => BehaviorSubject.seeded(<Candle>[]);
