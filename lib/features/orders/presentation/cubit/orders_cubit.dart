import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/core/res/gen/assets.gen.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';
import 'package:otlob/features/orders/domain/usecase/get_orders_usecase.dart';

import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUseCase _getOrdersUseCase;

  OrdersCubit(this._getOrdersUseCase) : super(const OrdersInitial());

  static final List<OrderModel> defaultOrders = [
    OrderModel(
      id: "1",
      orderNumber: "10245",
      status: OrderStatus.delivered,
      statusText: "Delivered",
      date: "15 Aug 2026",
      itemCount: 3,
      deliveryType: "Express",
      deliveryCost: 25.0,
      subTotal: 535.0,
      total: 560.0,
      previewItems: [
        OrderItemPreview(
          name: "Iced Coffee",
          assetPath: Assets.images.darkChocolateMocha.path,
          quantity: 2,
          price: 180.0,
        ),
        OrderItemPreview(
          name: "Cheesecake",
          assetPath: Assets.images.blueberryCheesecake.path,
          quantity: 1,
          price: 175.0,
        ),
      ],
    ),
    OrderModel(
      id: "2",
      orderNumber: "10189",
      status: OrderStatus.processing,
      statusText: "Processing",
      date: "12 Aug 2026",
      itemCount: 3,
      deliveryType: "Standard",
      deliveryCost: 15.0,
      subTotal: 400.0,
      total: 415.0,
      previewItems: [
        OrderItemPreview(
          name: "Caramel Drink",
          assetPath: Assets.images.doubleCaramelFrappuccino.path,
          quantity: 2,
          price: 200.0,
        ),
        OrderItemPreview(
          name: "Donuts",
          assetPath: Assets.images.glazedDonuts.path,
          quantity: 1,
          price: 180.0,
        ),
      ],
    ),
  ];

  Future<void> loadOrders() async {
    emit(const OrdersLoading());

    final result = await _getOrdersUseCase.execute(const NoParams());

    result.fold(
      (failure) => emit(OrdersError(failure.message)),
      (orders) {
        if (orders.isEmpty) {
          emit(const OrdersEmpty());
        } else {
          emit(OrdersSuccess(orders));
        }
      },
    );
  }
}
