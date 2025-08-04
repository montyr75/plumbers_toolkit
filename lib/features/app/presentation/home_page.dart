import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app_config.dart';
import '../../../routes.dart';
import '../../../utils/screen_utils.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: paddingAllM,
          child: Column(
            children: [
              boxXXL,
              Container(
                decoration: BoxDecoration(color: context.theme.colorScheme.primaryContainer),
                constraints: const BoxConstraints(maxWidth: 400),
                child: Image.asset('assets/images/logo.png'),
              ),
              boxXXL,
              ElevatedButton(
                onPressed: () => context.goNamed(AppRoute.offsetCalculator.name),
                child: Image.asset('assets/images/offset_calculator.png', width: 125),
              ),
              const Spacer(),
              const Text("v$version", textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
