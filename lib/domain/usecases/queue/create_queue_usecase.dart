import 'package:vmp_music/domain/entities/queue.dart';
import 'package:vmp_music/domain/repositories/queue_repository.dart';

/// Use case for creating a new queue
class CreateQueueUseCase {
  final IQueueRepository repository;

  CreateQueueUseCase(this.repository);

  /// Execute the use case
  /// [queue] the queue to create
  /// Returns the created queue
  /// Throws [AppException] on failure
  Future<Queue> call(Queue queue) async {
    return await repository.createQueue(queue);
  }
}
