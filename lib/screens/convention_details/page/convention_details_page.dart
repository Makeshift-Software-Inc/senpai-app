import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:senpai/models/events/convention/convention_model.dart';

@RoutePage()
class ConventionDetailsPage extends StatelessWidget {
  final ConventionModel convention;

  const ConventionDetailsPage({super.key, required this.convention});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(convention.title),
      ),
      body: const Placeholder(),
    );
  }
}
