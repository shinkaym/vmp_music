import 'package:vmp_music/domain/entities/queue.dart';
import 'package:vmp_music/domain/repositories/queue_repository.dart';

/// Use case for shuffling the queue
class ShuffleQueueUseCase {
  final IQueueRepository repository;

  ShuffleQueueUseCase(this.repository);

  /// Execute the use case
  /// Randomizes queue order while keeping current track
  /// Returns the updated queue
  Future<Queue> call() async {
    return await repository.shuffleQueue();
  }
}
