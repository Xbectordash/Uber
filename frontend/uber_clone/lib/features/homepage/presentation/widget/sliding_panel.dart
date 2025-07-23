import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uber_clone/features/auth/data/captain_model/get_captain.dart';
import 'package:uber_clone/features/homepage/presentation/widget/captain/captain_content_panel.dart';
import 'package:uber_clone/features/homepage/presentation/widget/passenger/user_content_panel.dart';
import 'package:uber_clone/features/homepage/presentation/widget/temppanelbody.dart';
import 'package:uber_clone/services/map_services.dart';

class SlidingPanel extends StatefulWidget {
  GetCaptain? captainData;
  final bool isUser;
  SlidingPanel({super.key, this.isUser = true , this.captainData});

  @override
  State<SlidingPanel> createState() => _SlidingPanelState();
}

class _SlidingPanelState extends State<SlidingPanel> {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: _panelController,
        minHeight: MediaQuery.of(context).viewInsets.bottom > 0 ? 250 : 200,
        maxHeight: MediaQuery.of(context).viewInsets.bottom > 0 ? 400 : 550,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        panel: widget.isUser?PanelContent(panelController: _panelController):CaptainContentPanel(captainData: widget.captainData!,),
        body: MapServices(),
      ),
    );
  }
}
