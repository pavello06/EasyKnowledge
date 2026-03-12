import 'package:easy_knowledge/common/presentation/widget/easy_cached_network_image.dart';
import 'package:easy_knowledge/core/theme/t.dart';
import 'package:easy_knowledge/feature/lesson/config/enum/lesson_element_type.dart';
import 'package:easy_knowledge/feature/lesson/domain/entity/lesson.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LessonLoadedContent extends StatefulWidget {
  const LessonLoadedContent({super.key, required this.lesson});

  final Lesson lesson;

  @override
  State<LessonLoadedContent> createState() => _LessonLoadedContentState();
}

class _LessonLoadedContentState extends State<LessonLoadedContent> {
  late final Lesson _lesson;
  final _managers = <int, FlickManager>{};

  @override
  void initState() {
    super.initState();

    _lesson = widget.lesson;
    for (int i = 0; i < _lesson.elements.length; i++) {
      final element = _lesson.elements[i];

      if (element.type == LessonElementType.video) {
        _managers[i] = FlickManager(
          videoPlayerController: VideoPlayerController.networkUrl(
            Uri.parse(element.content),
          ),
          autoPlay: false,
        );
      }
    }
  }

  @override
  void dispose() {
    for (final controller in _managers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Hero(
              tag: 'lesson-${_lesson.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16.0),
                ),
                child: EasyCachedNetworkImage(
                  _lesson.coverUrl,
                  width: double.infinity,
                  height: 250.0,
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16.0)),

          SliverToBoxAdapter(
            child: Text(_lesson.name, style: T.titleLarge(context)),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),

          SliverList.separated(
            itemBuilder: (_, index) {
              final element = _lesson.elements[index];

              return switch (element.type) {
                LessonElementType.text => Text(
                  element.content,
                  style: T.bodyMedium(context),
                ),
                LessonElementType.image => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: EasyCachedNetworkImage(
                      element.content,
                      width: double.infinity,
                      height: 200.0,
                    ),
                  ),
                ),
                LessonElementType.video => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200.0,
                      child: FlickVideoPlayer(
                        flickManager: _managers[index]!,
                      ),
                    ),
                  ),
                ),
              };
            },
            separatorBuilder: (_, _) => const SizedBox(height: 8.0),
            itemCount: _lesson.elements.length,
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
        ],
      ),
    );
  }
}
