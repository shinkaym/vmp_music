import 'package:vmp_music/domain/entities/queue.dart';
import 'package:vmp_music/domain/repositories/queue_repository.dart';

/// Use case for moving to the next track in queue
class MoveToNextUseCase {
  final IQueueRepository repository;

  MoveToNextUseCase(this.repository);

  /// Execute the use case
  /// Returns the updated queue
  /// Throws [AppException] if no next track available
  Future<Queue> call() async {
    return await repository.moveToNext();
  }
}
