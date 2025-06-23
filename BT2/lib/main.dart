import 'package:flutter/material.dart';
import 'models/product.dart';
import 'viewmodels/product_viewmodel.dart';
import 'screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Product(
      name: 'Giày Nike Nam Nữ Chính Hãng - Nike Air Force 1 \'07 LV8 - Màu Trắng | JapanSport HF2898-100',
      price: '4.000.000đ',
      description:
      'Với giày chạy bộ, từng gram đều quan trọng. Đó là lý do tại sao đế giữa LIGHTSTRIKE PRO mới nhẹ hơn so với phiên bản trước. Mút foam đế giữa siêu nhẹ và thoải mái này đã được thiết kế để hạn chế tiêu hao năng lượng. Trong các mẫu giày tập luyện, công nghệ này được thiết kế nhằm hỗ trợ cơ bắp của vận động viên để họ có thể phục hồi nhanh hơn giữa các cuộc đua.',
      imageUrl:
      'https://bizweb.dktcdn.net/thumb/1024x1024/100/347/092/products/giay-nike-air-force-1-white-black-gs-fv5948-101-1.jpg',
    );

    final viewModel = ProductViewModel(product: product);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetailScreen(viewModel: viewModel),
    );
  }
}
