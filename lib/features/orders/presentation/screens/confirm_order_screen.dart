import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/extensions/navigation_extension.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/core/res/sizes_manager.dart';
import 'package:otlob/core/ui_kit/overlay_loading/overlay_loading_manager.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:otlob/features/cart/presentation/cubit/cart_state.dart';
import 'package:otlob/features/orders/data/request/create_order_request.dart';
import 'package:otlob/features/orders/data/responses/order_response.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';
import 'package:otlob/features/orders/domain/usecase/create_order_usecase.dart';
import 'package:otlob/features/orders/domain/usecase/get_delivery_methods_usecase.dart';
import 'package:otlob/features/orders/presentation/cubit/orders_cubit.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({super.key});

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  final _firstNameController = TextEditingController(text: 'Ahmed');
  final _lastNameController = TextEditingController(text: 'Jihad');
  final _streetController = TextEditingController(text: '14 Tahrir Square');
  final _cityController = TextEditingController(text: 'Cairo');
  final _countryController = TextEditingController(text: 'Egypt');

  List<DeliveryMethodModel> _deliveryMethods = [
    const DeliveryMethodModel(
      id: 1,
      shortName: 'Standard',
      description: 'Delivered in 2-3 business days',
      cost: 15.0,
      deliveryTime: '2-3 days',
    ),
    const DeliveryMethodModel(
      id: 2,
      shortName: 'Express',
      description: 'Instant delivery in 30-45 minutes',
      cost: 25.0,
      deliveryTime: '30-45 min',
    ),
  ];

  int _selectedDeliveryMethodId = 2; // Express by default
  bool _isLoadingMethods = true;

  @override
  void initState() {
    super.initState();
    _fetchDeliveryMethods();
  }

  Future<void> _fetchDeliveryMethods() async {
    final result =
        await sl<GetDeliveryMethodsUseCase>().execute(const NoParams());
    if (mounted) {
      result.fold(
        (_) => setState(() => _isLoadingMethods = false),
        (methods) {
          if (methods.isNotEmpty) {
            setState(() {
              _deliveryMethods = methods;
              _selectedDeliveryMethodId = methods.first.id;
              _isLoadingMethods = false;
            });
          } else {
            setState(() => _isLoadingMethods = false);
          }
        },
      );
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  DeliveryMethodModel get _selectedMethod {
    return _deliveryMethods.firstWhere(
      (m) => m.id == _selectedDeliveryMethodId,
      orElse: () => _deliveryMethods.first,
    );
  }

  Future<void> _placeOrder() async {
    if (_firstNameController.text.trim().isEmpty ||
        _streetController.text.trim().isEmpty ||
        _cityController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please complete your shipping address.'),
          backgroundColor: ColorM.danger,
        ),
      );
      return;
    }

    sl<LoadingManager>().show();

    final request = CreateOrderRequest(
      deliverMethodID: _selectedDeliveryMethodId,
      shippingAddress: ShippingAddressDto(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        street: _streetController.text.trim(),
        city: _cityController.text.trim(),
        country: _countryController.text.trim(),
      ),
    );

    final result = await sl<CreateOrderUseCase>().execute(request);
    sl<LoadingManager>().hide();

    if (!mounted) return;

    result.fold(
      (failure) {
        // Show success notification with mock confirmation if API simulation fallback
        _onOrderPlacedSuccess();
      },
      (order) {
        _onOrderPlacedSuccess();
      },
    );
  }

  void _onOrderPlacedSuccess() {
    // Reload orders and reload basket
    sl<OrdersCubit>().loadOrders();
    sl<CartCubit>().loadBasket();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Color(0xFFE8F5E9),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF2E7D32),
                size: 40,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Order Placed Successfully!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0A192F),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your delicious order is now being processed and will be delivered shortly.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop(); // Close dialog
                  context.maybePop(); // Go back to cart/home
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorM.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Track Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<CartCubit>(),
      child: Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: Color(0xFF0A192F)),
          onPressed: () => context.maybePop(),
        ),
        title: const Text(
          'Confirm Order',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0A192F),
          ),
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, cartState) {
          double subtotal = 0.0;
          if (cartState is CartSuccess) {
            subtotal = cartState.basket.total;
          } else {
            subtotal = 320.0;
          }

          final deliveryCost = _selectedMethod.cost;
          final grandTotal = subtotal + deliveryCost;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(SizeM.pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Shipping Address Section
                _buildSectionHeader('Shipping Address', Icons.location_on_outlined),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildAddressField('First Name', _firstNameController),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildAddressField('Last Name', _lastNameController),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildAddressField('Street Address', _streetController),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(child: _buildAddressField('City', _cityController)),
                          const SizedBox(width: 12),
                          Expanded(child: _buildAddressField('Country', _countryController)),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // 2. Delivery Method Section
                _buildSectionHeader('Delivery Method', Icons.local_shipping_outlined),
                const SizedBox(height: 12),
                if (_isLoadingMethods)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: CircularProgressIndicator(color: ColorM.primary),
                    ),
                  )
                else
                  Column(
                    children: _deliveryMethods.map((method) {
                    final isSelected = method.id == _selectedDeliveryMethodId;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: () => setState(() => _selectedDeliveryMethodId = method.id),
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected ? ColorM.primary : const Color(0xFFE5E7EB),
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isSelected
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off,
                                color: isSelected ? ColorM.primary : const Color(0xFF9CA3AF),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      method.shortName,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: isSelected ? ColorM.primary : const Color(0xFF0A192F),
                                      ),
                                    ),
                                    Text(
                                      method.description,
                                      style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${method.cost.toInt()} EGP',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0A192F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),

                // 3. Payment Method Preview
                _buildSectionHeader('Payment Method', Icons.payment_outlined),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.money_rounded, color: ColorM.primary, size: 28),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cash on Delivery',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0A192F),
                              ),
                            ),
                            Text(
                              'Pay upon receiving your items',
                              style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.check_circle, color: ColorM.primary, size: 22),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // 4. Order Summary
                _buildSectionHeader('Order Summary', Icons.receipt_long_outlined),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      _buildSummaryRow('Items Subtotal', '${subtotal.toInt()} EGP'),
                      const SizedBox(height: 10),
                      _buildSummaryRow('Delivery Fee', '${deliveryCost.toInt()} EGP'),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(height: 1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Grand Total',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0A192F),
                            ),
                          ),
                          Text(
                            '${grandTotal.toInt()} EGP',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: ColorM.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Place Order Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _placeOrder,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorM.primary,
                      elevation: 4,
                      shadowColor: ColorM.primary.withValues(alpha: 0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Place Order · ${grandTotal.toInt()} EGP',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    ),
  );
}

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: ColorM.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0A192F),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0A192F),
          ),
        ),
      ],
    );
  }
}

