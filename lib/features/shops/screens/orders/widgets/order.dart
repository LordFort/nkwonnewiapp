import 'package:flutter/material.dart';
import '../../../../../common/widgets/App_bar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import 'orders_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall,), showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

       child:  TOrderListItems()
      ),
    );
  }
}
