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
import 'package:crypter/presentation/features/orders/notifiers/orders_notifier.dart';
import 'package:crypter/presentation/features/orders/providers/order_by_id_provider.dart';
import 'package:crypter/presentation/features/orders/widgets/custom_dropdown_menu_form_field.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Text(context.l10n.orderNumber, style: TextStyle(fontSize: 18)),
                  SizedBox(width: 4),
                  Expanded(
                    child: TextFormField(
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
                  ),
                ],
              ),
              SizedBox(height: 16),
              CustomDropdownMenuFormField<Exchange>(
                values: Exchange.values,
                initialSelection: Exchange.binance,
                itemBuilder: (exchange) => exchange.displayName,
                onSelected: (item) {},
                width: 150,
                controller: _exchangeController,
                textInputAction: .next,
              ),
              SizedBox(width: 16),
              CustomDropdownMenuFormField<Symbol>(
                values: Symbol.values,
                initialSelection: Symbol.ethusdt,
                itemBuilder: (symbol) => symbol.displayName,
                onSelected: (item) {},
                width: 150,
                controller: _symbolController,
                textInputAction: .next,
              ),
              SizedBox(height: 16),
              CustomDropdownMenuFormField<Side>(
                values: Side.values,
                initialSelection: Side.long,
                itemBuilder: (side) => side.displayName,
                onSelected: (item) {},
                width: 150,
                controller: _sideController,
                textInputAction: .next,
              ),
              SizedBox(height: 16),
              CustomDropdownMenuFormField<OrderStatus>(
                values: OrderStatus.values,
                initialSelection: OrderStatus.working,
                itemBuilder: (orderStatus) => orderStatus.displayName,
                onSelected: (item) {},
                width: 150,
                controller: _orderStatusController,
                textInputAction: .next,
              ),
              SizedBox(height: 16),
              TextFormField(
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
              SizedBox(height: 16),
              TextFormField(
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
              SizedBox(height: 16),
              TextFormField(
                controller: _placingTimeController,
                maxLength: 16,
                decoration: InputDecoration(labelText: context.l10n.placingTime, counterText: ''),
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
              SizedBox(height: 16),
              TextFormField(
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
              SizedBox(height: 16),
              TextFormField(
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
              SizedBox(height: 16),
              TextFormField(
                controller: _closingTimeController,
                maxLength: 16,
                decoration: InputDecoration(labelText: context.l10n.closingTime, counterText: ''),
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
              SizedBox(height: 16),
              TextFormField(
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
              SizedBox(height: 16),
              TextFormField(
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
              SizedBox(height: 16),
              TextFormField(
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
            ],
          ),
        ),
        SizedBox(height: 24),
        SizedBox(
          width: .infinity,
          child: ElevatedButton(
            onPressed: _onSave,
            style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(.infinity, 50))),
            child: Text(_isCreation ? context.l10n.save : context.l10n.update),
          ),
        ),
        SizedBox(height: 24),
        if (!_isCreation) ...[
          SizedBox(
            width: .infinity,
            child: ElevatedButton(
              onPressed: _onDelete,
              style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(.infinity, 50))),
              child: Text(context.l10n.delete),
            ),
          ),
          SizedBox(height: 24),
        ],
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
      ref.read(ordersProvider.notifier).getStopLossNotifications(firebaseMessagingNotification);
    } else {
      if (mounted) {
        final isConfirmed = await AppDialog.requestPermission(context);

        if (isConfirmed == true) {
          final granted = await ref.read(notificationsRepositoryProvider).requestPermission();

          if (granted) {
            ref
                .read(ordersProvider.notifier)
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
          ref.read(ordersProvider.notifier).updateOrder(_order);
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

      if (isConfirmed == true && mounted) {
        try {
          ref.read(ordersProvider.notifier).deleteOrder(_order.id!);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        }
        context.pop();
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
