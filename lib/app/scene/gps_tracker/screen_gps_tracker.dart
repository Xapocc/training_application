import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/gps_tracker/cubit/gps_tracker_cubit.dart';
import 'package:training_application/app/scene/gps_tracker/cubit/gps_tracker_state.dart';
import 'package:training_application/app/scene/splash/cubit/router_cubit.dart';

class ScreenGpsTracker extends StatelessWidget {
  const ScreenGpsTracker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GpsTrackerScreenCubit(),
      child: BlocBuilder<GpsTrackerScreenCubit, GpsTrackerScreenState>(
        builder: (context, state) {
          return Container(
            color: Colors.black,
            child: _stateBuilder(context, state),
          );
        },
      ),
    );
  }

  Widget _stateBuilder(context, state) {
    if (state is TrackingState) {
      return _trackingState(context, state);
    } else {
      return _pauseState(context, state);
    }
  }

  Widget _trackingState(context, state) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.all(mediaQueryData.size.width * 0.03),
                  child: _startStopButton(context, state),
                )),
                Visibility(
                    visible: (state as TrackingState).isTracking,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: _trackingIndicator(context, state)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pauseState(context, state) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: _pauseScreenButton(context, state, "Show Path", () {
            BlocProvider.of<RouterCubit>(context)
                .goToScreenGpsPathMap((state as PauseState).locationsData);
          },
              false,
              BlocProvider.of<GpsTrackerScreenCubit>(context)
                  .isLocationsDataEmpty()),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 8.0)),
        Flexible(
          child: _pauseScreenButton(context, state, "Start Again", () {
            BlocProvider.of<GpsTrackerScreenCubit>(context).goToTrackingState();
          }, true),
        ),
      ],
    ));
  }

  Widget _pauseScreenButton(context, state, String text, VoidCallback callback,
      [bool isSecondary = false, bool isDisabled = false]) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Visibility(
      visible: !isDisabled,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: FractionallySizedBox(
        heightFactor: 0.2,
        widthFactor: 0.7,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => !isSecondary ? Colors.blue : Colors.blueGrey),
          ),
          onPressed: callback,
          child: AutoSizeText(
            text,
            wrapWords: false,
            style: TextStyle(
              inherit: false,
              fontSize: mediaQueryData.size.height * 0.1,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _trackingIndicator(context, state) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    const TextStyle textStyle =
        TextStyle(inherit: false, color: Colors.white, fontSize: 24.0);

    return Padding(
      padding: EdgeInsets.only(bottom: mediaQueryData.size.width * 0.03),
      child: Column(
        children: [
          const FittedBox(
            child: Text(
              "Tracking...",
              style: textStyle,
            ),
          ),
          Text("GPS points saved: ${state.locationPointsCounter}",
              style: textStyle),
        ],
      ),
    );
  }

  Widget _startStopButton(BuildContext context, TrackingState state) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          Visibility(
            visible: state.isTracking,
            child: const Align(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              clipBehavior: Clip.antiAlias,
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) =>
                      !state.isTracking ? Colors.blue : Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(mediaQueryData.size.width),
                  ))),
              onPressed: () {
                BlocProvider.of<GpsTrackerScreenCubit>(context)
                    .onPressStartStopButton();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            !state.isTracking
                                ? "START\nTRACKING"
                                : "STOP\nTRACKING",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: state.isTracking
                                    ? Colors.blue
                                    : Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
