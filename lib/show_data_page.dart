import 'package:flutter/material.dart';
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
        return Center(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 5.0),
                borderRadius: BorderRadius.circular(45.0)),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        );
      } else if (state is DataState) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 5.0),
                borderRadius: BorderRadius.circular(45.0)),
            child: Center(
              child: Text(state.data,
                  style: const TextStyle(color: Colors.white, inherit: false)),
            ),
          ),
        );
      } else {
        return Center(
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5.0),
                  borderRadius: BorderRadius.circular(45.0)),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("error",
                            style:
                                TextStyle(color: Colors.red, inherit: false)),
                        Text("error",
                            style:
                                TextStyle(color: Colors.red, inherit: false)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("error",
                            style:
                                TextStyle(color: Colors.red, inherit: false)),
                        Text("error",
                            style:
                                TextStyle(color: Colors.red, inherit: false)),
                      ],
                    )
                  ],
                ),
              )),
        );
      }
    });
  }
}
