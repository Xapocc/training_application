import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/main_cubit.dart';
import 'cubit/main_state.dart';
import '../../colors.dart' as colors;
import '../../size.dart' as size;

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: BlocBuilder<MainScreenCubit, MainScreenState>(
          builder: (context, state) {
        if (state is LoadingState) {
          return mainScreenViewTemplate(
              const CircularProgressIndicator(
                color: colors.foregroundColorScreen,
              ),
              colors.loadingScreenColor);
        } else if (state is DataState) {
          return mainScreenViewTemplate(
              Text(state.data,
                  style: const TextStyle(
                      color: colors.foregroundColorScreen, inherit: false)),
              colors.dataScreenColor);
        } else if (state is ErrorState) {
          return mainScreenViewTemplate(
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: errorMessageRow(
                            state.errorMessage,
                            colors.circleTextColor0,
                            colors.circleBorderColor0,
                            colors.circleTextColor1,
                            colors.circleBorderColor1)),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              color: colors.centralErrorMessageBackgroundColor,
                              child: Center(
                                child: Text(
                                  state.errorMessage,
                                  style: const TextStyle(
                                      color: colors
                                          .centralErrorMessageForegroundColor,
                                      inherit: false,
                                      fontSize: size.fontSize),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: errorMessageRow(
                            state.errorMessage,
                            colors.circleTextColor2,
                            colors.circleBorderColor2,
                            colors.circleTextColor3,
                            colors.circleBorderColor3)),
                  ],
                ),
              ),
              colors.errorScreenColor);
        }
        return const Center();
      }),
    );
  }
}

Widget mainScreenViewTemplate(Widget child, Color borderColor) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
          color: colors.backgroundColorScreen,
          border: Border.all(color: borderColor, width: size.borderWidthScreen),
          borderRadius: BorderRadius.circular(size.borderRadiusScreen)),
      child: Center(
        child: child,
      ),
    ),
  );
}

Widget errorMessageCircle(
    String errorMessage, Color textColor, Color circleColor) {
  return AspectRatio(
    aspectRatio: 1,
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: circleColor, width: size.borderWidthCircle),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: AutoSizeText(errorMessage,
              minFontSize: 3.0,
              style: TextStyle(color: textColor, inherit: false)),
        ),
      ),
    ),
  );
}

Widget errorMessageRow(String errorMessage, Color textColor0,
    Color circleColor0, Color textColor1, Color circleColor1) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 1,
        child: errorMessageCircle(errorMessage, textColor0, circleColor0),
      ),
      Expanded(
        flex: 1,
        child: Container(),
      ),
      Expanded(
        flex: 1,
        child: errorMessageCircle(errorMessage, textColor1, circleColor1),
      ),
    ],
  );
}
