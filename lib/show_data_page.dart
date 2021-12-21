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
        return Container(
          color: Colors.blue,
        );
      } else if (state is LoadedState) {
        return Container(
          color: Colors.green,
        );
      } else {
        return Container(
          color: Colors.red,
        );
      }
    });
  }
}
