import 'package:flutter/material.dart';

/// Widget to display and manage audio playback progress
///
/// Shows current position, total duration, and allows seeking
class ProgressBarWidget extends StatefulWidget {
  final Duration currentPosition;
  final Duration totalDuration;
  final Function(Duration)? onSeek;
  final bool isDragging;
  final Color? activeColor;
  final Color? inactiveColor;

  const ProgressBarWidget({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
    this.onSeek,
    this.isDragging = false,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  late Duration _draggedPosition;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _draggedPosition = widget.currentPosition;
  }

  @override
  void didUpdateWidget(ProgressBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isDragging) {
      _draggedPosition = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress slider
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(
                overlayRadius: 12,
              ),
              activeTrackColor:
                  widget.activeColor ?? Theme.of(context).colorScheme.primary,
              inactiveTrackColor: widget.inactiveColor ??
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              thumbColor:
                  widget.activeColor ?? Theme.of(context).colorScheme.primary,
            ),
            child: Slider(
              value: _draggedPosition.inMilliseconds
                  .toDouble()
                  .clamp(0, widget.totalDuration.inMilliseconds.toDouble()),
              max: widget.totalDuration.inMilliseconds.toDouble(),
              onChanged: (value) {
                setState(() {
                  _isDragging = true;
                  _draggedPosition = Duration(milliseconds: value.toInt());
                });
              },
              onChangeEnd: (value) {
                setState(() {
                  _isDragging = false;
                });
                widget.onSeek?.call(_draggedPosition);
              },
            ),
          ),
          const SizedBox(height: 8),
          // Time display
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(
                    _isDragging ? _draggedPosition : widget.currentPosition),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                _formatDuration(widget.totalDuration),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Format duration to MM:SS
  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

/// Compact progress bar widget (just the slider without time display)
class CompactProgressBar extends StatefulWidget {
  final Duration currentPosition;
  final Duration totalDuration;
  final Function(Duration)? onSeek;
  final Color? activeColor;
  final Color? inactiveColor;

  const CompactProgressBar({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
    this.onSeek,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  State<CompactProgressBar> createState() => _CompactProgressBarState();
}

class _CompactProgressBarState extends State<CompactProgressBar> {
  late Duration _draggedPosition;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _draggedPosition = widget.currentPosition;
  }

  @override
  void didUpdateWidget(CompactProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isDragging) {
      _draggedPosition = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 3,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
        activeTrackColor:
            widget.activeColor ?? Theme.of(context).colorScheme.primary,
        inactiveTrackColor: widget.inactiveColor ??
            Theme.of(context).colorScheme.surfaceContainerHighest,
        thumbColor: widget.activeColor ?? Theme.of(context).colorScheme.primary,
      ),
      child: Slider(
        value: _draggedPosition.inMilliseconds
            .toDouble()
            .clamp(0, widget.totalDuration.inMilliseconds.toDouble()),
        max: widget.totalDuration.inMilliseconds.toDouble(),
        onChanged: (value) {
          setState(() {
            _isDragging = true;
            _draggedPosition = Duration(milliseconds: value.toInt());
          });
        },
        onChangeEnd: (value) {
          setState(() {
            _isDragging = false;
          });
          widget.onSeek?.call(_draggedPosition);
        },
      ),
    );
  }
}

/// Minimal progress indicator (no interaction)
class ProgressIndicator extends StatelessWidget {
  final Duration currentPosition;
  final Duration totalDuration;
  final Color? activeColor;
  final Color? backgroundColor;
  final double height;

  const ProgressIndicator({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
    this.activeColor,
    this.backgroundColor,
    this.height = 2,
  });

  @override
  Widget build(BuildContext context) {
    final progress = totalDuration.inMilliseconds > 0
        ? currentPosition.inMilliseconds / totalDuration.inMilliseconds
        : 0.0;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: height,
          width: (progress * 100).clamp(0, 100).toDouble() + 100,
          decoration: BoxDecoration(
            color: activeColor ?? Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
      ),
    );
  }
}

/// Time display widget
class TimeDisplay extends StatelessWidget {
  final Duration currentPosition;
  final Duration totalDuration;
  final TextStyle? style;

  const TimeDisplay({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _formatDuration(currentPosition),
          style: style ?? Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(width: 4),
        Text(
          '/',
          style: style ?? Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(width: 4),
        Text(
          _formatDuration(totalDuration),
          style: style ?? Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  /// Format duration to MM:SS
  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
