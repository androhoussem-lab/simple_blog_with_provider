import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/post_provider.dart';
import 'package:provider_app/views/home_screen.dart';

main(){
  runApp(ProviderApp());
}

class ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: PostProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider App',
        theme: ThemeData(
          primaryColor: Colors.redAccent.shade400,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
