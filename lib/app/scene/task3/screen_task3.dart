import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/size.dart';

import 'cubit/task3_cubit.dart';
import 'cubit/task3_state.dart';

class ScreenTask3 extends StatelessWidget {
  const ScreenTask3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Task3ScreenCubit(),
      child: BlocBuilder<Task3ScreenCubit, Task3ScreenState>(
          builder: (context, state) {
        if (state is LoadingState) {
          return _task3ScreenViewTemplate(
              const CircularProgressIndicator(
                color: AppColors.colorForegroundMainScreen,
              ),
              AppColors.colorBorderLoadingScreen);
        } else if (state is DataState) {
          return _task3ScreenViewTemplate(
              Text(state.data,
                  style: const TextStyle(
                      color: AppColors.colorForegroundMainScreen,
                      inherit: false)),
              AppColors.colorBorderDataScreen);
        } else if (state is ErrorState) {
          return _task3ScreenViewTemplate(
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: _errorMessageRow(
                            state.errorMessage,
                            AppColors.colorsTextMainScreenCircle[0],
                            AppColors.colorsBorderMainScreenCircle[0],
                            AppColors.colorsTextMainScreenCircle[1],
                            AppColors.colorsBorderMainScreenCircle[1])),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              color: AppColors.colorBgCentralErrorMessage,
                              child: Center(
                                child: Text(
                                  state.errorMessage,
                                  style: const TextStyle(
                                      color:
                                          AppColors.colorFgCentralErrorMessage,
                                      inherit: false,
                                      fontSize:
                                          AppSizes.sizeFontCentralErrorMessage),
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
                            AppColors.colorsTextMainScreenCircle[2],
                            AppColors.colorsBorderMainScreenCircle[2],
                            AppColors.colorsTextMainScreenCircle[3],
                            AppColors.colorsBorderMainScreenCircle[3])),
                  ],
                ),
              ),
              AppColors.colorBorderErrorScreen);
        }
        return const Center();
      }),
    );
  }
}

Widget _task3ScreenViewTemplate(Widget child, Color colorBorder) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.colorBackgroundMainScreen,
          border: Border.all(
              color: colorBorder, width: AppSizes.widthBorderMainScreen),
          borderRadius: BorderRadius.circular(AppSizes.radiusBorderMainScreen)),
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
        border: Border.all(
            color: colorBorder, width: AppSizes.widthBorderErrorCircle),
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

Widget _errorMessageRow(
    String errorMessage,
    Color colorTextCircle0,
    Color colorBorderCircle0,
    Color colorTextCircle1,
    Color colorBorderCircle1) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 1,
        child: _errorMessageCircle(
            errorMessage, colorTextCircle0, colorBorderCircle0),
      ),
      Expanded(
        flex: 1,
        child: Container(),
      ),
      Expanded(
        flex: 1,
        child: _errorMessageCircle(
            errorMessage, colorTextCircle1, colorBorderCircle1),
      ),
    ],
  );
}
