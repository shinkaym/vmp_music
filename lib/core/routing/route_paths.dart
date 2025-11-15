/// Route path constants for the VMP Music application
///
/// This file defines all the route paths used throughout the application.
/// Each route is defined as a constant for type safety and consistency.
abstract class RoutePaths {
  // Root routes
  static const String root = '/';
  static const String library = '/library';
  static const String player = '/player';
  static const String playlists = '/playlists';
  static const String queue = '/queue';

  // Detail routes with parameters
  static const String playlistDetail = '/playlists/:playlistId';
  static const String musicDetail = '/music/:musicId';

  // Route names for GoRouter
  static const String libraryName = 'library';
  static const String playerName = 'player';
  static const String playlistsName = 'playlists';
  static const String playlistDetailName = 'playlistDetail';
  static const String queueName = 'queue';
  static const String musicDetailName = 'musicDetail';

  // Method to generate playlist detail route with ID
  static String playlistDetailRoute(String playlistId) =>
      '/playlists/$playlistId';

  // Method to generate music detail route with ID
  static String musicDetailRoute(String musicId) => '/music/$musicId';
}
