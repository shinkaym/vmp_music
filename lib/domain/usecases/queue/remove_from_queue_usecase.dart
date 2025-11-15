import 'package:vmp_music/domain/entities/queue.dart';
import 'package:vmp_music/domain/repositories/queue_repository.dart';

/// Use case for removing music from the queue
class RemoveFromQueueUseCase {
  final IQueueRepository repository;

  RemoveFromQueueUseCase(this.repository);

  /// Execute the use case
  /// [musicId] the ID of the music to remove
  /// Returns the updated queue
  /// Throws [AppException] if music not in queue
  Future<Queue> call(String musicId) async {
    return await repository.removeMusicFromQueue(musicId);
  }
}
