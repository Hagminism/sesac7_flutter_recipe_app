import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/home/presentation/screen/home_screen_view_model.dart';

import 'home_screen.dart';

class HomeScreenRoot extends StatelessWidget {
  final HomeScreenViewModel viewModel;

  const HomeScreenRoot({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (BuildContext context, Widget? child) {
        return HomeScreen(
          state: viewModel.state,
          onAction: (action) {
            viewModel.onAction(action);
          },
        );
      },
    );
  }
}
