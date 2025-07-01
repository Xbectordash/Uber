import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uber_clone/features/homepage/data/get_distance_time_model.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_distance_time/get_distance_time_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_distance_time/get_distance_time_state.dart';
import 'package:uber_clone/features/homepage/presentation/widget/search_panel_widget.dart';
import 'package:uber_clone/features/homepage/presentation/widget/distance_time_panel.dart';

class PanelContent extends StatefulWidget {
  final PanelController? panelController;
  const PanelContent({super.key, this.panelController});

  @override
  State<PanelContent> createState() => _PanelContentState();
}

class _PanelContentState extends State<PanelContent> {
  final FocusNode _pickupFocus = FocusNode();
  final FocusNode _destinationFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _pickupFocus.addListener(_handleFocusChange);
    _destinationFocus.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if ((widget.panelController != null) && (_pickupFocus.hasFocus || _destinationFocus.hasFocus)) {
      widget.panelController!.open();
    }
  }

  @override
  void dispose() {
    _pickupFocus.removeListener(_handleFocusChange);
    _destinationFocus.removeListener(_handleFocusChange);
    _pickupFocus.dispose();
    _destinationFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Larger tap area for the handle
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (widget.panelController != null) {
                if (widget.panelController!.isPanelClosed) {
                  widget.panelController!.open();
                } else {
                  widget.panelController!.close();
                }
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 32, // Larger tap area
              child: Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<GetDistanceTimeBloc, GetDistanceTimeState>(
              builder: (context, state) {
                if (state is IntialGetDistanceTimeState) {
                  return SearchPanelWidget(
                    pickupFocusNode: _pickupFocus,
                    destinationFocusNode: _destinationFocus,
                  );
                } else if (state is LoadingGetDistanceTimeState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadedGetDistanceTimeState) {
                  return DistanceTimePanel(distanceTime: state.distanceTime);
                } else if (state is ErrorGetDistanceTimeState) {
                  return Center(child: Text('Error: \\${state.message}'));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
