import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'show_data_cubit.dart';
import 'main_screen_state.dart';

class ShowDataPage extends StatelessWidget {
  const ShowDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowDataCubit, MainScreenState>(
        builder: (context, state) {
      if (state is LoadingState) {
        return mainScreenViewTemplate(
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            Colors.blue);
      } else if (state is DataState) {
        return mainScreenViewTemplate(
            Text(state.data,
                style: const TextStyle(color: Colors.white, inherit: false)),
            Colors.green);
      } else if (state is ErrorState) {
        return mainScreenViewTemplate(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child: errorMessageRow(state.errorMessage, Colors.orange,
                          Colors.red, Colors.white, Colors.orange)),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.purpleAccent,
                            child: Center(
                              child: Text(
                                state.errorMessage,
                                style: const TextStyle(
                                    color: Colors.yellow,
                                    inherit: false,
                                    fontSize: ErrorState.fontSize),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: errorMessageRow(state.errorMessage, Colors.red,
                          Colors.yellow, Colors.yellow, Colors.white)),
                ],
              ),
            ),
            Colors.red);
      }
      return const Center();
    });
  }
}

Widget mainScreenViewTemplate(Widget child, Color borderColor) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: borderColor, width: 5.0),
          borderRadius: BorderRadius.circular(45.0)),
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
          border: Border.all(color: circleColor, width: 5.0),
          borderRadius: BorderRadius.circular(90.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Center(
            child: Text(errorMessage,
                style: TextStyle(color: textColor, inherit: false)),
          ),
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
