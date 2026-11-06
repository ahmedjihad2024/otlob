import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob/core/res/gen/assets.gen.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(const OrdersInitial());

  static final List<OrderModel> defaultOrders = [
    OrderModel(
      id: "1",
      orderNumber: "10245",
      status: OrderStatus.delivered,
      statusText: "Delivered",
      date: "15 Aug 2026",
      itemCount: 3,
      deliveryType: "Express",
      total: 560.0,
      previewItems: [
        OrderItemPreview(
          name: "Iced Coffee",
          assetPath: Assets.images.darkChocolateMocha.path,
        ),
        OrderItemPreview(
          name: "Cheesecake",
          assetPath: Assets.images.blueberryCheesecake.path,
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
      total: 415.0,
      previewItems: [
        OrderItemPreview(
          name: "Caramel Drink",
          assetPath: Assets.images.doubleCaramelFrappuccino.path,
        ),
        OrderItemPreview(
          name: "Donuts",
          assetPath: Assets.images.glazedDonuts.path,
        ),
      ],
    ),
  ];

  Future<void> loadOrders() async {
    emit(const OrdersLoading());
    // Simulate brief network fetch
    await Future.delayed(const Duration(milliseconds: 300));
    emit(OrdersSuccess(defaultOrders));
  }
}
