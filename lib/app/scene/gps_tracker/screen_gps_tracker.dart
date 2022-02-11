import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/scene/gps_tracker/cubit/gps_tracker_cubit.dart';
import 'package:training_application/app/scene/gps_tracker/cubit/gps_tracker_state.dart';
import 'package:training_application/app/router/cubit/router_cubit.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/main.dart';

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
            color: AppColors.colorBgGpsTrackerScreen,
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
                    padding: EdgeInsets.all(mediaQueryData.size.width *
                        AppSizes.paddingFactorTrackingStateGpsTrackerScreen),
                    child: _startStopButton(context, state),
                  ),
                ),
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
            child: _pauseScreenButton(
                context, state, l10n.nextButtonPauseStateGpsTrackerScreen, () {
              BlocProvider.of<GpsTrackerScreenCubit>(context)
                  .saveLocationsData()
                  .then((value) => BlocProvider.of<RouterCubit>(context)
                      .goToScreenGpsPathMap());
            },
                false,
                BlocProvider.of<GpsTrackerScreenCubit>(context)
                    .isLocationsDataEmpty()),
          ),
          const Padding(
            padding: EdgeInsets.only(
                bottom: AppSizes.paddingPauseStateGpsTrackerScreen),
          ),
          Flexible(
            child: _pauseScreenButton(
                context, state, l10n.backButtonPauseStateGpsTrackerScreen, () {
              BlocProvider.of<GpsTrackerScreenCubit>(context)
                  .goToTrackingState();
            }, true),
          ),
        ],
      ),
    );
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
        heightFactor: AppSizes.factorHeightPauseButtonGpsTrackerScreen,
        widthFactor: AppSizes.factorWidthPauseButtonGpsTrackerScreen,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) =>
                !isSecondary
                    ? AppColors.colorBgMainPauseButtonGpsTrackerScreen
                    : AppColors.colorBgSecondaryPauseButtonGpsTrackerScreen),
          ),
          onPressed: callback,
          child: AutoSizeText(
            text,
            wrapWords: false,
            style: TextStyle(
              inherit: false,
              fontSize: mediaQueryData.size.height *
                  AppSizes.textSizeFactorPauseButtonGpsTrackerScreen,
              color: AppColors.colorFgPauseButtonGpsTrackerScreen,
            ),
          ),
        ),
      ),
    );
  }

  Widget _trackingIndicator(context, state) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    TextStyle textStyle = TextStyle(
        inherit: false,
        color: AppColors.colorFgTrackingIndicatorGpsTrackerScreen,
        fontSize: mediaQueryData.size.height *
            AppSizes.textSizeFactorTrackingIndicatorGpsTrackerScreen);

    return Padding(
      padding: EdgeInsets.only(
          bottom: mediaQueryData.size.width *
              AppSizes.paddingFactorTrackingIndicatorGpsTrackerScreen),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              l10n.trackingTrackingIndicatorGpsTrackerScreen,
              style: textStyle,
            ),
          ),
          Text(
              l10n.counterTrackingIndicatorGpsTrackerScreen(
                  state.locationPointsCounter),
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
                widthFactor:
                    AppSizes.factorWidthStartStopButtonGpsTrackerScreen,
                heightFactor:
                    AppSizes.factorHeightStartStopButtonGpsTrackerScreen,
                child: CircularProgressIndicator(
                  color: AppColors.colorProgressIndicatorGpsTrackerScreen,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
                AppSizes.paddingStartStopButtonGpsTrackerScreen),
            child: ElevatedButton(
              clipBehavior: Clip.antiAlias,
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) =>
                    !state.isTracking
                        ? AppColors.colorMainStartStopButtonGpsTrackerScreen
                        : AppColors
                            .colorSecondaryStartStopButtonGpsTrackerScreen),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(mediaQueryData.size.width),
                  ),
                ),
              ),
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
                            l10n.buttonTrackingStateGpsTrackerScreen(
                                state.isTracking ? 0 : 1),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: state.isTracking
                                    ? AppColors
                                        .colorMainStartStopButtonGpsTrackerScreen
                                    : AppColors
                                        .colorSecondaryStartStopButtonGpsTrackerScreen),
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
