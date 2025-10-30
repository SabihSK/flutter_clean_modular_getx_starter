import 'package:flutter/material.dart';
import 'package:flutter_clean_modular_getx_starter/presentation/widgets/base_scaffold.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      body: Center(
        child: Text("404 - Page Not Found", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
