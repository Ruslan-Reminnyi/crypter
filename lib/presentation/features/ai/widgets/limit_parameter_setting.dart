import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/presentation/features/ai/notifiers/ai_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const double kLimitNumberWidth = 50.0;
const double kLimitNumberHeight = 30.0;

class LimitRequestSetting extends ConsumerStatefulWidget {
  const LimitRequestSetting({super.key});

  @override
  ConsumerState<LimitRequestSetting> createState() => _LimitRequestSettingState();
}

class _LimitRequestSettingState extends ConsumerState<LimitRequestSetting> {
  double _limit = 1.0;

  @override
  void initState() {
    _limit = ref.read(aiProvider).limit.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 2.0,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    context.l10n.limit.toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: SizedBox(
                      width: kLimitNumberWidth,
                      height: kLimitNumberHeight,
                      child: Align(
                        alignment: .center,
                        child: Text(
                          _limit.round().toString(),
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Slider.adaptive(
                value: _limit,
                min: 1,
                max: 500,
                thumbColor: Theme.of(context).colorScheme.primary,
                activeColor: Theme.of(context).colorScheme.primary,
                inactiveColor: Theme.of(context).colorScheme.tertiary,
                onChanged: (value) {
                  setState(() {
                    _limit = value;
                  });
                },
                onChangeEnd: (value) {
                  ref.read(aiProvider.notifier).changeLimit(value.round());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
