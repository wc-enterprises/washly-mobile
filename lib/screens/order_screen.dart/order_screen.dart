import 'package:flutter/material.dart';
import 'package:washly_mobile/screens/order_screen.dart/order_screen1.dart';
import 'package:washly_mobile/screens/order_screen.dart/order_screen3.dart';
import 'package:washly_mobile/screens/order_screen.dart/orderScreen1_viewmodel.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderScreen1ViewModel>(builder: ((context, _, child) {
      return Scaffold(body: PageView.builder(itemBuilder: ((context, index) {
        return PageView(
          controller: context.watch<OrderScreen1ViewModel>().pageController,
          children: [
            const OrderScreen1(),
            //OrderScreen2(),
            OrderScreen3(),
          ],
        );
      })));
    }));
  }
}
