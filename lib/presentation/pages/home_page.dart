import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/image_bloc.dart';
import '../bloc/image_event.dart';
import '../bloc/image_state.dart';
import '../widgets/image_square.dart';
import '../widgets/another_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImageBloc()..add(FetchImage()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
      final theme = Theme.of(context);
      Color backgroundColor = theme.scaffoldBackgroundColor;
      String? url;
      bool loading = false;
      String? error;

      if (state is ImageLoadInProgress) {
        loading = true;
      } else if (state is ImageLoadSuccess) {
        url = state.url;
        if (state.dominantColor != null) backgroundColor = state.dominantColor!;
      } else if (state is ImageLoadFailure) {
        error = state.message;
      }

      final onBackground = ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark
          ? Colors.white
          : Colors.black;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        color: backgroundColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.shortestSide * 0.672,
                      height: MediaQuery.of(context).size.shortestSide * 0.672,
                      child: Semantics(
                        label: 'Random image',
                        child: ImageSquare(
                          imageUrl: url,
                          loading: loading,
                          error: error,
                          onTap: () => context.read<ImageBloc>().add(FetchImage()),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  child: Column(
                    children: [
                      AnotherButton(
                        onPressed: loading ? null : () => context.read<ImageBloc>().add(FetchImage()),
                        loading: loading,
                        onBackground: onBackground,
                      ),
                      if (error != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            'Error: $error',
                            style: TextStyle(color: onBackground),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
