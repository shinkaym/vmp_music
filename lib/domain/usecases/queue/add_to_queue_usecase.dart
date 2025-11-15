import 'package:vmp_music/domain/entities/queue.dart';
import 'package:vmp_music/domain/repositories/queue_repository.dart';

/// Use case for adding music to the queue
class AddToQueueUseCase {
  final IQueueRepository repository;

  AddToQueueUseCase(this.repository);

  /// Execute the use case
  /// [musicId] the ID of the music to add
  /// [position] optional position to insert at (default: end of queue)
  /// Returns the updated queue
  /// Throws [AppException] on failure
  Future<Queue> call(String musicId, {int? position}) async {
    return await repository.addMusicToQueue(musicId, position: position);
  }
}
