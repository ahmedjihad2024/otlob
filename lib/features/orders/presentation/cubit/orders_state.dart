import 'package:equatable/equatable.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object?> get props => [];
}

final class OrdersInitial extends OrdersState {
  const OrdersInitial();
}

final class OrdersLoading extends OrdersState {
  const OrdersLoading();
}

final class OrdersEmpty extends OrdersState {
  const OrdersEmpty();
}

final class OrdersSuccess extends OrdersState {
  final List<OrderModel> orders;

  const OrdersSuccess(this.orders);

  @override
  List<Object?> get props => [orders];
}

final class OrdersError extends OrdersState {
  final String message;

  const OrdersError(this.message);

  @override
  List<Object?> get props => [message];
}
