import 'package:vmp_music/domain/entities/queue.dart';
import 'package:vmp_music/domain/repositories/queue_repository.dart';

/// Use case for moving to the previous track in queue
class MoveToPreviousUseCase {
  final IQueueRepository repository;

  MoveToPreviousUseCase(this.repository);

  /// Execute the use case
  /// Returns the updated queue
  /// Throws [AppException] if no previous track available
  Future<Queue> call() async {
    return await repository.moveToPrevious();
  }
}
