import 'package:vmp_music/domain/entities/queue.dart';
import 'package:vmp_music/domain/repositories/queue_repository.dart';

/// Use case for clearing the entire queue
class ClearQueueUseCase {
  final IQueueRepository repository;

  ClearQueueUseCase(this.repository);

  /// Execute the use case
  /// Returns the empty queue
  Future<Queue> call() async {
    return await repository.clearQueue();
  }
}
