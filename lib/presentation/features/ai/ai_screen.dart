import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/domain/enums/symbol.dart';
import 'package:crypter/domain/enums/interval.dart';
import 'package:crypter/presentation/common/validators/input_error.dart';
import 'package:crypter/presentation/common/validators/validators.dart';
import 'package:crypter/presentation/common/widgets/custom_dropdown_menu.dart';
import 'package:crypter/presentation/features/ai/notifiers/ai_notifier.dart';
import 'package:crypter/presentation/features/ai/widgets/recommendation_tile.dart';
import 'package:flutter/material.dart' hide Interval;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AiScreen extends ConsumerStatefulWidget {
  const AiScreen({super.key});

  @override
  ConsumerState<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends ConsumerState<AiScreen> {
  final _formKey = GlobalKey<FormState>(debugLabel: 'ai_screen_global_key');

  late final TextEditingController _limitController;
  late final TextEditingController _promptController;

  @override
  void didChangeDependencies() {
    _limitController = TextEditingController(text: ref.read(aiProvider).limit.toString());
    _promptController = TextEditingController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(aiProvider);
    final provider = ref.watch(aiProvider.notifier);
    final size = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text(context.l10n.ai)),
          floatingActionButton: Tooltip(
            message: context.l10n.generate,
            child: FloatingActionButton(
              onPressed: _askAI,
              child: Icon(Icons.question_answer_rounded),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(context.l10n.askAIToGenerateRecommendationsForCreatingOrder),
                  SizedBox(height: 16),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: .min,
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            CustomDropdownMenu(
                              values: Symbol.values,
                              initialSelection: state.symbol,
                              itemBuilder: (symbol) => symbol.displayName,
                              onSelected: (value) {
                                if (value != null) provider.changeSymbol(value);
                              },
                              width: 160,
                            ),
                            CustomDropdownMenu(
                              values: Interval.values,
                              initialSelection: state.interval,
                              itemBuilder: (interval) => interval.timeframe,
                              onSelected: (value) {
                                if (value != null) provider.changeInterval(value);
                              },
                              width: 160,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _limitController,
                          keyboardType: .number,
                          textInputAction: .next,
                          validator: (value) {
                            final result = Validators.intInput(value);

                            return switch (result) {
                              EmptyInputError() => context.l10n.thisIsRequiredField,
                              InvalidIntFormatError() =>
                                context.l10n.thisInputMustContainOnlyNumbers,
                              _ => null,
                            };
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _promptController,
                          decoration: InputDecoration(
                            hintText: context.l10n.askAIToGenerateRecommendationsForCreatingOrder,
                          ),
                          textInputAction: .next,
                          maxLines: 4,
                          validator: (value) {
                            final result = Validators.prompt(value);

                            return switch (result) {
                              EmptyInputError() => context.l10n.thisIsRequiredField,
                              InvalidPromptFormatError() =>
                                context.l10n.promptMustBeAtLeastTwentyCharacters,
                              _ => null,
                            };
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(state.title, textAlign: .center),
                  SizedBox(height: 16),
                  Text(state.description),
                  SizedBox(height: 16),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.recommendations.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) =>
                        RecommendationTile(recommendation: state.recommendations[index]),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
        if (state.isLoading)
          AbsorbPointer(
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: ColoredBox(
                color: Colors.black45,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
      ],
    );
  }

  void _askAI() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(aiProvider.notifier).generateOrderCreationRecommendations(_promptController.text);

      _promptController.clear();
    }
  }

  @override
  void dispose() {
    _limitController.dispose();
    _promptController.dispose();

    super.dispose();
  }
}
