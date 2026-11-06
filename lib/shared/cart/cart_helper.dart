import 'package:flutter/material.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:otlob/shared/cart/data/request/update_basket_request.dart';
import 'package:otlob/shared/cart/domain/usecase/update_basket_item_usecase.dart';

Future<void> addProductToCartHelper({
  required BuildContext context,
  required int productId,
  required String productName,
  int quantity = 1,
}) async {
  final result = await sl<UpdateBasketItemUseCase>().execute(
    UpdateBasketRequest(productId: productId, quantity: quantity),
  );

  result.fold(
    (failure) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.message),
            backgroundColor: ColorM.danger,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    },
    (basket) {
      sl<CartCubit>().loadBasket();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$productName added to cart!'),
            backgroundColor: const Color(0xFF0A192F),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    },
  );
}
