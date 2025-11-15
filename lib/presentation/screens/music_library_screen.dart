import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmp_music/presentation/providers/music_library_provider.dart';
import 'package:vmp_music/presentation/widgets/index.dart';
import 'package:vmp_music/core/routing/route_paths.dart';
import 'package:go_router/go_router.dart';

/// Screen to display and manage the music library
///
/// Shows all available music tracks with search, sort, and add music functionality
class MusicLibraryScreen extends ConsumerStatefulWidget {
  const MusicLibraryScreen({super.key});

  @override
  ConsumerState<MusicLibraryScreen> createState() => _MusicLibraryScreenState();
}

class _MusicLibraryScreenState extends ConsumerState<MusicLibraryScreen> {
  final TextEditingController _searchController = TextEditingController();
  late List<dynamic> _filteredMusic;
  SortOption _sortOption = SortOption.title;

  @override
  void initState() {
    super.initState();
    // Load all music when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(musicLibraryProvider.notifier).loadAllMusic();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final musicLibraryState = ref.watch(musicLibraryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Library'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () => _showSortDialog(context),
            tooltip: 'Sort',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search songs...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {});
                        },
                      )
                    : null,
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          // Music list
          Expanded(
            child: _buildMusicList(context, musicLibraryState),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMusicDialog(context),
        tooltip: 'Add Music',
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Build the music list widget
  Widget _buildMusicList(BuildContext context, MusicLibraryState state) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: ${state.error}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  ref.read(musicLibraryProvider.notifier).loadAllMusic(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state.musicList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.music_note, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'No music in library',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            CustomButton(
              label: 'Add Music',
              onPressed: () => _showAddMusicDialog(context),
              icon: Icons.add,
            ),
          ],
        ),
      );
    }

    // Filter music based on search
    _filteredMusic = state.musicList;
    if (_searchController.text.isNotEmpty) {
      _filteredMusic = state.musicList
          .where((music) =>
              music.title
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()) ||
              music.artist
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()))
          .toList();
    }

    // Sort music
    _sortMusic();

    return ListView.builder(
      itemCount: _filteredMusic.length,
      itemBuilder: (context, index) {
        final music = _filteredMusic[index];
        return MusicTile(
          music: music,
          onTap: () {
            // Play music - will be integrated with player in Phase 10
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Playing: ${music.title}')),
            );
          },
          onFavoriteTap: () {
            ref.read(musicLibraryProvider.notifier).toggleFavorite(music.id);
          },
          onPlayTap: () {
            // Play music
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Playing: ${music.title}')),
            );
          },
          onDeleteTap: () {
            _showDeleteConfirmation(context, music.id, music.title);
          },
        );
      },
    );
  }

  /// Sort music based on selected option
  void _sortMusic() {
    switch (_sortOption) {
      case SortOption.title:
        _filteredMusic.sort((a, b) => a.title.compareTo(b.title));
        break;
      case SortOption.artist:
        _filteredMusic.sort((a, b) => a.artist.compareTo(b.artist));
        break;
      case SortOption.duration:
        _filteredMusic.sort((a, b) => a.duration.compareTo(b.duration));
        break;
      case SortOption.dateAdded:
        _filteredMusic.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
        break;
    }
  }

  /// Show sort options dialog
  void _showSortDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sort By'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<SortOption>(
                title: const Text('Title'),
                value: SortOption.title,
                groupValue: _sortOption,
                onChanged: (value) {
                  setState(() => _sortOption = value!);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<SortOption>(
                title: const Text('Artist'),
                value: SortOption.artist,
                groupValue: _sortOption,
                onChanged: (value) {
                  setState(() => _sortOption = value!);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<SortOption>(
                title: const Text('Duration'),
                value: SortOption.duration,
                groupValue: _sortOption,
                onChanged: (value) {
                  setState(() => _sortOption = value!);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<SortOption>(
                title: const Text('Date Added'),
                value: SortOption.dateAdded,
                groupValue: _sortOption,
                onChanged: (value) {
                  setState(() => _sortOption = value!);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Show add music dialog (placeholder)
  void _showAddMusicDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add music functionality coming soon')),
    );
  }

  /// Show delete confirmation dialog
  void _showDeleteConfirmation(
    BuildContext context,
    String musicId,
    String musicTitle,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Music'),
        content: Text('Are you sure you want to delete "$musicTitle"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(musicLibraryProvider.notifier).deleteMusic(musicId);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Music deleted')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

/// Sort options enum
enum SortOption { title, artist, duration, dateAdded }
