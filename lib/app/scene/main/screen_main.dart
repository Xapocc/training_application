import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/main_cubit.dart';
import 'cubit/main_state.dart';
import '../../colors.dart' as colors;
import '../../size.dart' as size;

class ScreenMain extends StatelessWidget {
  const ScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: BlocBuilder<MainScreenCubit, MainScreenState>(
          builder: (context, state) {
        if (state is LoadingState) {
          return _mainScreenViewTemplate(
              const CircularProgressIndicator(
                color: colors.colorForegroundMainScreen,
              ),
              colors.colorBorderLoadingScreen);
        } else if (state is DataState) {
          return _mainScreenViewTemplate(
              Text(state.data,
                  style: const TextStyle(
                      color: colors.colorForegroundMainScreen, inherit: false)),
              colors.colorBorderDataScreen);
        } else if (state is ErrorState) {
          return _mainScreenViewTemplate(
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: _errorMessageRow(
                            state.errorMessage,
                            colors.colorsTextMainScreenCircle[0],
                            colors.colorsBorderMainScreenCircle[0],
                            colors.colorsTextMainScreenCircle[1],
                            colors.colorsBorderMainScreenCircle[1])),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              color: colors.colorBgCentralErrorMessage,
                              child: Center(
                                child: Text(
                                  state.errorMessage,
                                  style: const TextStyle(
                                      color: colors.colorFgCentralErrorMessage,
                                      inherit: false,
                                      fontSize:
                                          size.sizeFontCentralErrorMessage),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: _errorMessageRow(
                            state.errorMessage,
                            colors.colorsTextMainScreenCircle[2],
                            colors.colorsBorderMainScreenCircle[2],
                            colors.colorsTextMainScreenCircle[3],
                            colors.colorsBorderMainScreenCircle[3])),
                  ],
                ),
              ),
              colors.colorBorderErrorScreen);
        }
        return const Center();
      }),
    );
  }
}

Widget _mainScreenViewTemplate(Widget child, Color colorBorder) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
          color: colors.colorBackgroundMainScreen,
          border:
              Border.all(color: colorBorder, width: size.widthBorderMainScreen),
          borderRadius: BorderRadius.circular(size.radiusBorderMainScreen)),
      child: Center(
        child: child,
      ),
    ),
  );
}

Widget _errorMessageCircle(
    String errorMessage, Color colorText, Color colorBorder) {
  return AspectRatio(
    aspectRatio: 1,
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border:
            Border.all(color: colorBorder, width: size.widthBorderErrorCircle),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: AutoSizeText(errorMessage,
              minFontSize: 3.0,
              style: TextStyle(color: colorText, inherit: false)),
        ),
      ),
    ),
  );
}

Widget _errorMessageRow(String errorMessage, Color colorTextCircle0,
    Color colorBorderCircle0, Color colorTextCircle1, Color colorBorderCircle1) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 1,
        child: _errorMessageCircle(errorMessage, colorTextCircle0, colorBorderCircle0),
      ),
      Expanded(
        flex: 1,
        child: Container(),
      ),
      Expanded(
        flex: 1,
        child: _errorMessageCircle(errorMessage, colorTextCircle1, colorBorderCircle1),
      ),
    ],
  );
}
