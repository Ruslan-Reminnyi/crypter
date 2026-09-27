import 'dart:io';

import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/data/models/firebase_messaging_notification/firebase_messaging_notification.dart';
import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/domain/enums/exchange.dart';
import 'package:crypter/domain/enums/symbol.dart';
import 'package:crypter/domain/enums/side.dart';
import 'package:crypter/domain/enums/order_status.dart';
import 'package:crypter/presentation/common/dialogs/app_dialog.dart';
import 'package:crypter/presentation/common/formatters/app_input_formatters.dart';
import 'package:crypter/presentation/common/validators/input_error.dart';
import 'package:crypter/presentation/common/validators/validators.dart';
import 'package:crypter/presentation/common/widgets/app_button.dart';
import 'package:crypter/presentation/common/widgets/parameter_setting.dart';
import 'package:crypter/presentation/features/orders/notifiers/orders_notifier.dart';
import 'package:crypter/presentation/features/orders/providers/order_by_id_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OrderPage extends ConsumerStatefulWidget {
  final int? id;

  const OrderPage(this.id, {super.key});

  @override
  ConsumerState<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
  bool get _isCreation => widget.id == null;
  bool _areControllersInitialized = false;

  final _formKey = GlobalKey<FormState>(debugLabel: 'order_page_global_key');

  late final TextEditingController _numberController;
  late final TextEditingController _exchangeController;
  late final TextEditingController _symbolController;
  late final TextEditingController _sideController;
  late final TextEditingController _orderStatusController;
  late final TextEditingController _quantityController;
  late final TextEditingController _priceController;
  late final TextEditingController _placingTimeController;
  late final TextEditingController _takeProfitController;
  late final TextEditingController _stopLossController;
  late final TextEditingController _closingTimeController;
  late final TextEditingController _leverageController;
  late final TextEditingController _marginController;
  late final TextEditingController _realizedPnLController;

  late Order _order;

  @override
  void initState() {
    if (_isCreation) {
      _initControllers();
    }

    super.initState();
  }

  void _initControllers() {
    _numberController = TextEditingController(text: _isCreation ? null : _order.number.toString());
    _exchangeController = TextEditingController(
      text: _isCreation ? null : _order.exchange.toString(),
    );
    _symbolController = TextEditingController(text: _isCreation ? null : _order.symbol.toString());
    _sideController = TextEditingController(text: _isCreation ? null : _order.side.toString());
    _orderStatusController = TextEditingController(
      text: _isCreation ? null : _order.status.toString(),
    );
    _quantityController = TextEditingController(
      text: _isCreation ? null : _order.quantity.toString(),
    );
    _priceController = TextEditingController(
      text: _isCreation ? null : _order.fillPrice.toString(),
    );
    _placingTimeController = TextEditingController(
      text: _isCreation ? null : _order.formatDateTime(),
    );
    _takeProfitController = TextEditingController(
      text: _isCreation ? null : _order.takeProfit.toString(),
    );
    _stopLossController = TextEditingController(
      text: _isCreation ? null : _order.stopLoss.toString(),
    );
    _closingTimeController = TextEditingController(
      text: _isCreation ? null : _order.formatDateTime(false),
    );
    _leverageController = TextEditingController(text: _isCreation ? null : _order.leverage);
    _marginController = TextEditingController(text: _isCreation ? null : _order.margin.toString());
    _realizedPnLController = TextEditingController(
      text: _isCreation ? null : _order.formatRealizedPnL(),
    );

    _areControllersInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    final mobileAndTabletAppBar = AppBar(
      title: Text(context.l10n.order),
      leading: IconButton(onPressed: context.pop, icon: Icon(Icons.arrow_back_rounded)),
    );

    return Scaffold(
      appBar: context.responsiveValue(
        mobile: () => mobileAndTabletAppBar,
        tablet: () => mobileAndTabletAppBar,
        desktop: () => null,
      ),
      backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: _isCreation
              ? _buildOrderPageContent(context)
              : ref
                    .watch(orderByIdProvider(widget.id!))
                    .when(
                      data: (order) {
                        _order = order;
                        if (!_areControllersInitialized) _initControllers();

                        return _buildOrderPageContent(context);
                      },
                      error: (Object error, StackTrace stackTrace) =>
                          Text("Error getting the order - $error\n$stackTrace"),
                      loading: () => CircularProgressIndicator(),
                    ),
        ),
      ),
    );
  }

  Widget _buildOrderPageContent(BuildContext context) {
    return Column(
      spacing: 24.0,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.responsiveValue(
              mobile: () => 0.0,
              tablet: () => 24.0,
              desktop: () => 24.0,
            ),
            vertical: context.responsiveValue(
              mobile: () => 0.0,
              tablet: () => 0.0,
              desktop: () => 24.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: .end,
            spacing: 8.0,
            children: [
              AppButton(
                label: context.l10n.save,
                callback: _onSave,
                width: context.responsiveValue(
                  mobile: () => 110.0,
                  tablet: () => 150.0,
                  desktop: () => 150.0,
                ),
                prefixIcon: Icons.save_rounded,
              ),
              if (!_isCreation) ...[
                AppButton(
                  label: context.l10n.update,
                  callback: _onSave,
                  width: context.responsiveValue(
                    mobile: () => 110.0,
                    tablet: () => 150.0,
                    desktop: () => 150.0,
                  ),
                  prefixIcon: Icons.mode_edit_outline_rounded,
                  color: Colors.transparent,
                  labelColor: Theme.of(context).colorScheme.primaryContainer,
                  borderColor: Theme.of(context).colorScheme.primaryContainer,
                ),
                AppButton(
                  label: context.l10n.delete,
                  callback: _onDelete,
                  width: context.responsiveValue(
                    mobile: () => 110.0,
                    tablet: () => 150.0,
                    desktop: () => 150.0,
                  ),
                  prefixIcon: Icons.delete_outline_rounded,
                  color: Colors.transparent,
                  labelColor: Theme.of(context).colorScheme.onTertiaryContainer,
                  borderColor: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ],
            ],
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            spacing: 16.0,
            children: [
              _SettingsSection(
                symbolSetting: ParameterSetting<Symbol>(
                  label: context.l10n.symbol,
                  values: Symbol.values,
                  itemBuilder: (symbol) => symbol.displayName,
                  onSelected: (item) {},
                ),
                exchangeSetting: ParameterSetting<Exchange>(
                  label: context.l10n.interval,
                  values: Exchange.values,
                  itemBuilder: (exchange) => exchange.displayName,
                  onSelected: (item) {},
                ),
                sideSetting: ParameterSetting<Side>(
                  label: context.l10n.side,
                  values: Side.values,
                  itemBuilder: (side) => side.displayName,
                  onSelected: (item) {},
                ),
                orderStatusSetting: ParameterSetting<OrderStatus>(
                  label: context.l10n.status,
                  values: OrderStatus.values,
                  itemBuilder: (orderStatus) => orderStatus.displayName,
                  onSelected: (item) {},
                ),
              ),
              _TextFormFieldsSection(
                numberLabel: context.l10n.orderNumber,
                numberField: TextFormField(
                  autofocus: true,
                  controller: _numberController,
                  decoration: InputDecoration(hintText: context.l10n.number),
                  keyboardType: .number,
                  textInputAction: .next,
                  validator: (value) {
                    final result = Validators.intInput(value);

                    return switch (result) {
                      EmptyInputError() => context.l10n.thisIsRequiredField,
                      InvalidIntFormatError() => context.l10n.thisInputMustContainOnlyNumbers,
                      _ => null,
                    };
                  },
                ),
                quantityLabel: context.l10n.quantity,
                quantityField: TextFormField(
                  controller: _quantityController,
                  decoration: InputDecoration(hintText: context.l10n.quantity),
                  keyboardType: .numberWithOptions(decimal: true),
                  textInputAction: .next,
                  validator: (value) {
                    final result = Validators.doubleInput(value);

                    return switch (result) {
                      EmptyInputError() => context.l10n.thisIsRequiredField,
                      InvalidIntOrDoubleFormatError() =>
                        context.l10n.thisInputMustContainEitherNumbersOrDecimal,
                      _ => null,
                    };
                  },
                ),
                fillPriceLabel: context.l10n.fillPrice,
                fillPriceField: TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(hintText: context.l10n.fillPrice),
                  keyboardType: .numberWithOptions(decimal: true),
                  textInputAction: .next,
                  validator: (value) {
                    final result = Validators.doubleInput(value);

                    return switch (result) {
                      EmptyInputError() => context.l10n.thisIsRequiredField,
                      InvalidIntOrDoubleFormatError() =>
                        context.l10n.thisInputMustContainEitherNumbersOrDecimal,
                      _ => null,
                    };
                  },
                ),
                placingTimeLabel: context.l10n.placingTime,
                placingTimeField: TextFormField(
                  controller: _placingTimeController,
                  maxLength: 16,
                  decoration: InputDecoration(hintText: context.l10n.placingTime, counterText: ''),
                  keyboardType: .datetime,
                  textInputAction: .next,
                  inputFormatters: AppInputFormatters.orderDateTime(),
                  validator: (value) {
                    final result = Validators.dateTime(value);

                    return switch (result) {
                      EmptyInputError() => context.l10n.thisIsRequiredField,
                      InvalidDateTimeFormatError() => context.l10n.dateTimeFormatIs,
                      DateTimeDoesNotExistError() => context.l10n.thisDateDoesNotExist,
                      _ => null,
                    };
                  },
                ),
                takeProfitLabel: context.l10n.takeProfit,
                takeProfitField: TextFormField(
                  controller: _takeProfitController,
                  decoration: InputDecoration(hintText: context.l10n.takeProfit),
                  keyboardType: .numberWithOptions(decimal: true),
                  textInputAction: .next,
                  validator: (value) {
                    final result = Validators.doubleInput(value, isRequired: false);

                    return switch (result) {
                      InvalidIntOrDoubleFormatError() =>
                        context.l10n.thisInputMustContainEitherNumbersOrDecimal,
                      _ => null,
                    };
                  },
                ),
                stopLossLabel: context.l10n.stopLoss,
                stopLossField: TextFormField(
                  controller: _stopLossController,
                  decoration: InputDecoration(hintText: context.l10n.stopLoss),
                  keyboardType: .numberWithOptions(decimal: true),
                  textInputAction: .next,
                  validator: (value) {
                    final result = Validators.doubleInput(value, isRequired: false);

                    return switch (result) {
                      InvalidIntOrDoubleFormatError() =>
                        context.l10n.thisInputMustContainEitherNumbersOrDecimal,
                      _ => null,
                    };
                  },
                ),
                closingTimeLabel: context.l10n.closingTime,
                closingTimeField: TextFormField(
                  controller: _closingTimeController,
                  maxLength: 16,
                  decoration: InputDecoration(hintText: context.l10n.closingTime, counterText: ''),
                  keyboardType: .datetime,
                  textInputAction: .next,
                  inputFormatters: AppInputFormatters.orderDateTime(),
                  validator: (value) {
                    final result = Validators.dateTime(value, isRequired: false);

                    return switch (result) {
                      InvalidDateTimeFormatError() => context.l10n.dateTimeFormatIs,
                      DateTimeDoesNotExistError() => context.l10n.thisDateDoesNotExist,
                      _ => null,
                    };
                  },
                ),
                leverageLabel: context.l10n.leverage,
                leverageField: TextFormField(
                  controller: _leverageController,
                  decoration: InputDecoration(hintText: context.l10n.leverage),
                  keyboardType: .phone,
                  textInputAction: .next,
                  inputFormatters: AppInputFormatters.orderLeverage(),
                  validator: (value) {
                    final result = Validators.leverage(value);

                    return switch (result) {
                      InvalidLeverageFormatError() => context.l10n.useHereSomethingLike,
                      _ => null,
                    };
                  },
                ),
                marginLabel: context.l10n.margin,
                marginField: TextFormField(
                  controller: _marginController,
                  decoration: InputDecoration(hintText: context.l10n.margin),
                  keyboardType: .numberWithOptions(decimal: true),
                  textInputAction: .next,
                  validator: (value) {
                    final result = Validators.doubleInput(value, isRequired: false);

                    return switch (result) {
                      InvalidIntOrDoubleFormatError() =>
                        context.l10n.thisInputMustContainEitherNumbersOrDecimal,
                      _ => null,
                    };
                  },
                ),
                realizedPnLLabel: context.l10n.realizedPnL,
                realizedPnLField: TextFormField(
                  controller: _realizedPnLController,
                  decoration: InputDecoration(hintText: context.l10n.realizedPnL),
                  keyboardType: .numberWithOptions(signed: true, decimal: true),
                  textInputAction: .done,
                  onEditingComplete: _onSave,
                  validator: (value) {
                    final result = Validators.realizedPnL(value);

                    return switch (result) {
                      InvalidRealizedPnLFormatError() =>
                        context.l10n.thisFieldMustStartFromEitherMinusOrPlus,
                      _ => null,
                    };
                  },
                ),
              ),
              SizedBox(
                height: context.responsiveValue(
                  mobile: () => 12.0,
                  tablet: () => 12.0,
                  desktop: () => 0.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Order _createNewOrder() => Order(
    id: _isCreation ? null : _order.id,
    number: int.parse(_numberController.text),
    exchange: Exchange.values.firstWhere(((item) => item.displayName == _exchangeController.text)),
    symbol: Symbol.values.firstWhere(((item) => item.displayName == _symbolController.text)),
    status: OrderStatus.values.firstWhere(
      ((item) => item.displayName == _orderStatusController.text),
    ),
    side: Side.values.firstWhere(((item) => item.displayName == _sideController.text)),
    quantity: double.parse(_quantityController.text),
    placingTime: DateTime.parse(_placingTimeController.text),
    fillPrice: double.parse(_priceController.text),
    takeProfit: double.tryParse(_takeProfitController.text),
    stopLoss: double.tryParse(_stopLossController.text),
    closingTime: DateTime.tryParse(_closingTimeController.text),
    leverage: _leverageController.text,
    margin: double.tryParse(_marginController.text),
    realizedPnL: double.tryParse(_realizedPnLController.text),
  );

  Future<void> _getNotificationsIfPermissionGranted(int? newId) async {
    final firebaseMessagingNotification = FirebaseMessagingNotification(
      orderId: _isCreation ? newId : _order.id,
      platform: kIsWeb ? 'web' : Platform.operatingSystem,
      symbol: _symbolController.text,
      side: _sideController.text,
      stopLoss: double.tryParse(_stopLossController.text) ?? 0.0,
    );

    final areNotificationsGranted = await ref
        .read(notificationsRepositoryProvider)
        .isPermissionGranted();

    if (areNotificationsGranted) {
      await ref
          .read(laravelDatabaseServiceProvider)
          .getStopLossNotifications(firebaseMessagingNotification);
    } else {
      if (mounted) {
        final isConfirmed = await AppDialog.requestPermission(context);

        if (isConfirmed == true) {
          final granted = await ref.read(notificationsRepositoryProvider).requestPermission();

          if (granted) {
            await ref
                .read(laravelDatabaseServiceProvider)
                .getStopLossNotifications(firebaseMessagingNotification);
          }
        }
      }
    }
  }

  void _onSave() async {
    if (_formKey.currentState?.validate() ?? false) {
      _order = _createNewOrder();

      int? newId;
      try {
        if (_isCreation) {
          newId = await ref.read(ordersProvider.notifier).saveOrder(_order);
        } else {
          await ref.read(ordersProvider.notifier).updateOrder(_order);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }

      if (_stopLossController.text.isNotEmpty && newId != null) {
        await _getNotificationsIfPermissionGranted(newId);
      }

      if (mounted) {
        context.pop();
      }
    }
  }

  void _onDelete() async {
    if (_formKey.currentState?.validate() ?? false) {
      final isConfirmed = await AppDialog.orderDeletion(context);

      if (isConfirmed == true) {
        try {
          await ref.read(ordersProvider.notifier).deleteOrder(_order.id!);
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
          }
        }
        if (mounted) {
          context.pop();
        }
      }
    }
  }

  @override
  void dispose() {
    _numberController.dispose();
    _exchangeController.dispose();
    _symbolController.dispose();
    _sideController.dispose();
    _orderStatusController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _placingTimeController.dispose();
    _takeProfitController.dispose();
    _stopLossController.dispose();
    _closingTimeController.dispose();
    _leverageController.dispose();
    _marginController.dispose();
    _realizedPnLController.dispose();

    super.dispose();
  }
}

class _SettingsSection extends StatelessWidget {
  final Widget _symbolSetting;
  final Widget _exchangeSetting;
  final Widget _sideSetting;
  final Widget _orderStatusSetting;

  const _SettingsSection({
    required this._symbolSetting,
    required this._exchangeSetting,
    required this._sideSetting,
    required this._orderStatusSetting,
  });

  @override
  Widget build(BuildContext context) {
    final mobileLayout = Column(
      mainAxisSize: .min,
      spacing: 12.0,
      children: [_symbolSetting, _exchangeSetting, _sideSetting, _orderStatusSetting],
    );
    final tabletAndDesktopLayout = Column(
      spacing: 12.0,
      children: [
        Row(spacing: 12.0, children: [_symbolSetting, _exchangeSetting]),
        Row(spacing: 12.0, children: [_sideSetting, _orderStatusSetting]),
      ],
    );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: context.responsiveValue(
        mobile: () => mobileLayout,
        tablet: () => tabletAndDesktopLayout,
        desktop: () => tabletAndDesktopLayout,
      ),
    );
  }
}

class _TextFormField extends StatelessWidget {
  final String _label;
  final Widget _textFormField;

  const _TextFormField(this._label, this._textFormField);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 108.0,
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
                Text(_label.toUpperCase(), style: Theme.of(context).textTheme.bodySmall),
                _textFormField,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabletAndDesktopSettingRow extends StatelessWidget {
  final String _leftLabel;
  final Widget _leftTextFormField;
  final String _rightLabel;
  final Widget _rightTextFormField;

  const _TabletAndDesktopSettingRow({
    required this._leftLabel,
    required this._leftTextFormField,
    required this._rightLabel,
    required this._rightTextFormField,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: .min,
        spacing: 16.0,
        children: [
          _TextFormField(_leftLabel, _leftTextFormField),
          _TextFormField(_rightLabel, _rightTextFormField),
        ],
      ),
    );
  }
}

class _TextFormFieldsSection extends StatelessWidget {
  final String _numberLabel;
  final Widget _numberField;
  final String _quantityLabel;
  final Widget _quantityField;
  final String _fillPriceLabel;
  final Widget _fillPriceField;
  final String _placingTimeLabel;
  final Widget _placingTimeField;
  final String _takeProfitLabel;
  final Widget _takeProfitField;
  final String _stopLossLabel;
  final Widget _stopLossField;
  final String _closingTimeLabel;
  final Widget _closingTimeField;
  final String _leverageLabel;
  final Widget _leverageField;
  final String _marginLabel;
  final Widget _marginField;
  final String _realizedPnLLabel;
  final Widget _realizedPnLField;

  const _TextFormFieldsSection({
    required this._numberLabel,
    required this._numberField,
    required this._quantityLabel,
    required this._quantityField,
    required this._fillPriceLabel,
    required this._fillPriceField,
    required this._placingTimeLabel,
    required this._placingTimeField,
    required this._takeProfitLabel,
    required this._takeProfitField,
    required this._stopLossLabel,
    required this._stopLossField,
    required this._closingTimeLabel,
    required this._closingTimeField,
    required this._leverageLabel,
    required this._leverageField,
    required this._marginLabel,
    required this._marginField,
    required this._realizedPnLLabel,
    required this._realizedPnLField,
  });

  @override
  Widget build(BuildContext context) {
    final mobileLayout = Column(
      mainAxisSize: .min,
      spacing: 16.0,
      children: [
        _TextFormField(_numberLabel, _numberField),
        _TextFormField(_quantityLabel, _quantityField),
        _TextFormField(_fillPriceLabel, _fillPriceField),
        _TextFormField(_placingTimeLabel, _placingTimeField),
        _TextFormField(_takeProfitLabel, _takeProfitField),
        _TextFormField(_stopLossLabel, _stopLossField),
        _TextFormField(_closingTimeLabel, _closingTimeField),
        _TextFormField(_leverageLabel, _leverageField),
        _TextFormField(_marginLabel, _marginField),
        _TextFormField(_realizedPnLLabel, _realizedPnLField),
      ],
    );
    final tabletAndDesktopLayout = Column(
      spacing: 16.0,
      children: [
        _TabletAndDesktopSettingRow(
          leftLabel: _numberLabel,
          leftTextFormField: _numberField,
          rightLabel: _quantityLabel,
          rightTextFormField: _quantityField,
        ),
        _TabletAndDesktopSettingRow(
          leftLabel: _fillPriceLabel,
          leftTextFormField: _fillPriceField,
          rightLabel: _placingTimeLabel,
          rightTextFormField: _placingTimeField,
        ),
        _TabletAndDesktopSettingRow(
          leftLabel: _takeProfitLabel,
          leftTextFormField: _takeProfitField,
          rightLabel: _stopLossLabel,
          rightTextFormField: _stopLossField,
        ),
        _TabletAndDesktopSettingRow(
          leftLabel: _closingTimeLabel,
          leftTextFormField: _closingTimeField,
          rightLabel: _leverageLabel,
          rightTextFormField: _leverageField,
        ),
        _TabletAndDesktopSettingRow(
          leftLabel: _marginLabel,
          leftTextFormField: _marginField,
          rightLabel: _realizedPnLLabel,
          rightTextFormField: _realizedPnLField,
        ),
      ],
    );

    return context.responsiveValue(
      mobile: () => mobileLayout,
      tablet: () => tabletAndDesktopLayout,
      desktop: () => tabletAndDesktopLayout,
    );
  }
}
