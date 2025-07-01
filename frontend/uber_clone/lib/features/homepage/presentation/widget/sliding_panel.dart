import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uber_clone/features/homepage/presentation/widget/panel_content.dart';
import 'package:uber_clone/features/homepage/presentation/widget/panel_body_content.dart';
import 'package:uber_clone/features/homepage/presentation/widget/temppanelbody.dart';

class SlidingPanel extends StatefulWidget {
  const SlidingPanel({super.key});

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
        panel: PanelContent(panelController: _panelController),
        body: const TempPanelBody(),
      ),
    );
  }
}
