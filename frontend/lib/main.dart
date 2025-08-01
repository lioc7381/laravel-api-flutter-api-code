import 'package:flutter/material.dart';
import 'screens/auth/login.dart';
import 'screens/auth/register.dart';
import 'screens/categories/categories_list.dart';
import 'providers/category_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Welcome to Flutter',
        home: Login(),
        routes: {
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          '/categories': (context) => CategoriesList(),
        },
      ),
    );
  }
}
