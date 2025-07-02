import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class UserSocketService {
  IO.Socket? socket;

  void connect(String userId) {
    // Connect to your backend socket server
    socket = IO.io('http://YOUR_BACKEND_URL:PORT', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket!.connect();

    // On connect, emit join event
    socket!.on('connect', (_) {
      debugPrint('User connected to socket');
      socket!.emit('join', {
        'userID': userId,
        'userType': 'user',
      });
    });

    // Listen for ride confirmation or updates from backend
    socket!.on('ride-confirmed', (data) {
      debugPrint('Ride confirmed: $data');
      // Handle ride confirmation (e.g., show captain details)
    });

    // Listen for other events as needed (e.g., ride status updates)
    socket!.on('ride-status-update', (data) {
      debugPrint('Ride status update: $data');
      // Handle status update
    });
  }

  void disconnect() {
    socket?.disconnect();
  }
}