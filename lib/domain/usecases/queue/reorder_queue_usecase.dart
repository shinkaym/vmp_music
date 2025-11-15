import 'package:vmp_music/domain/entities/queue.dart';
import 'package:vmp_music/domain/repositories/queue_repository.dart';

/// Use case for reordering the queue
class ReorderQueueUseCase {
  final IQueueRepository repository;

  ReorderQueueUseCase(this.repository);

  /// Execute the use case
  /// [fromIndex] current position of the music
  /// [toIndex] new position for the music
  /// Returns the updated queue
  /// Throws [AppException] if indices are invalid
  Future<Queue> call(int fromIndex, int toIndex) async {
    return await repository.reorderQueue(fromIndex, toIndex);
  }
}
