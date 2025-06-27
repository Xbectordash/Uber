import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uber_clone/features/homepage/presentation/widget/panel_content.dart';
import 'package:uber_clone/features/homepage/presentation/widget/panel_body_content.dart';

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
      body: GestureDetector(
        // Detect tap anywhere on the empty area of the panel or body
        onTap: () {
          if (_panelController.isPanelClosed) {
            _panelController.open();
          } else if (_panelController.isPanelOpen) {
            _panelController.close();
          }
        },
        child: SlidingUpPanel(
          controller: _panelController,
          minHeight: 100,
          maxHeight: 550,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          panel: const PanelContent(),
          body: const PanelBodyContent(),
        ),
      ),
    );
  }
}
