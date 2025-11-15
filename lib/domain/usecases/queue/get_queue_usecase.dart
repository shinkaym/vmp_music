import 'package:vmp_music/domain/entities/queue.dart';
import 'package:vmp_music/domain/repositories/queue_repository.dart';

/// Use case for retrieving the current playback queue
class GetQueueUseCase {
  final IQueueRepository repository;

  GetQueueUseCase(this.repository);

  /// Execute the use case
  /// Returns the current queue or null if not initialized
  Future<Queue?> call() async {
    return await repository.getQueue();
  }
}
