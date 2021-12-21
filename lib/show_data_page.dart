import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'show_data_cubit.dart';

class ShowDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowDataCubit, Widget> (
      builder: (context, widget) => widget,
    );
  }

}