import 'package:vmp_music/domain/entities/queue.dart';
import 'package:vmp_music/domain/repositories/queue_repository.dart';

/// Use case for replacing the entire queue with a new music list
class ReplaceQueueUseCase {
  final IQueueRepository repository;

  ReplaceQueueUseCase(this.repository);

  /// Execute the use case
  /// [musicIds] list of music IDs for the new queue
  /// [startFromIndex] optional starting index (default: 0)
  /// Returns the updated queue
  Future<Queue> call(List<String> musicIds, {int startFromIndex = 0}) async {
    return await repository.replaceQueue(musicIds, startFromIndex: startFromIndex);
  }
}
