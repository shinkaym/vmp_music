import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vmp_music/presentation/screens/index.dart';
import 'route_paths.dart';

/// GoRouter configuration for VMP Music application
///
/// Manages all navigation routes and transitions in the app.
/// Provides a centralized way to handle navigation across the application.
final appRouter = GoRouter(
  initialLocation: RoutePaths.library,
  debugLogDiagnostics: false,
  routes: [
    // Music Library Route
    GoRoute(
      path: RoutePaths.library,
      name: RoutePaths.libraryName,
      builder: (context, state) => const MusicLibraryScreen(),
    ),

    // Player Route
    GoRoute(
      path: RoutePaths.player,
      name: RoutePaths.playerName,
      builder: (context, state) => const PlayerScreen(),
    ),

    // Playlists Route with subroutes
    GoRoute(
      path: RoutePaths.playlists,
      name: RoutePaths.playlistsName,
      builder: (context, state) => const PlaylistsScreen(),
      routes: [
        // Playlist Detail Route
        GoRoute(
          path: ':playlistId',
          name: RoutePaths.playlistDetailName,
          builder: (context, state) {
            final playlistId = state.pathParameters['playlistId']!;
            return PlaylistDetailScreen(playlistId: playlistId);
          },
        ),
      ],
    ),

    // Queue Route
    GoRoute(
      path: RoutePaths.queue,
      name: RoutePaths.queueName,
      builder: (context, state) => const QueueScreen(),
    ),
  ],

  // Error handling - shows a default error screen if route not found
  errorBuilder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Route not found',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              state.error.toString(),
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.library),
              child: const Text('Go to Library'),
            ),
          ],
        ),
      ),
    );
  },
);
