import 'package:easy_knowledge/common/presentation/widget/easy_cached_network_image.dart';
import 'package:easy_knowledge/common/presentation/widget/easy_rating.dart';
import 'package:easy_knowledge/core/extension/pretty_date.dart';
import 'package:easy_knowledge/core/l10n/s.dart';
import 'package:easy_knowledge/core/theme/t.dart';
import 'package:easy_knowledge/feature/course/domain/entity/course.dart';
import 'package:easy_knowledge/feature/course/presentation/widget/course_lesson_card.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CourseLoadedContent extends StatefulWidget {
  const CourseLoadedContent({
    super.key,
    required this.route,
    required this.course,
  });

  final String route;
  final Course course;

  @override
  State<CourseLoadedContent> createState() => _CourseLoadedContentState();
}

class _CourseLoadedContentState extends State<CourseLoadedContent> {
  late final Course _course;
  late final FlickManager? _manager;

  @override
  void initState() {
    super.initState();

    _course = widget.course;
    _manager = widget.course.introUrl == null
        ? null
        : FlickManager(
            videoPlayerController: VideoPlayerController.networkUrl(
              Uri.parse(_course.introUrl!),
            ),
            autoPlay: false,
          );
  }

  @override
  void dispose() {
    _manager?.dispose();

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
              tag: 'course-${_course.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16.0),
                ),
                child: EasyCachedNetworkImage(
                  _course.coverUrl,
                  width: double.infinity,
                  height: 250.0,
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16.0)),

          SliverToBoxAdapter(
            child: Text(_course.name, style: T.titleLarge(context)),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),

          SliverToBoxAdapter(
            child: Wrap(
              spacing: 4.0,
              runSpacing: 4.0,
              children: _course.topics
                  .map((topic) => Text(topic, style: T.titleMedium(context)))
                  .toList(),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),

          SliverToBoxAdapter(
            child: EasyRating(rating: _course.rating, size: 20.0),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),

          SliverToBoxAdapter(
            child: Text(
              S
                  .of(context)
                  .courseLoadedContentPublishedAt(
                    _course.publishedAt.pretty(context),
                  ),
              style: T.titleMedium(context),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),

          SliverToBoxAdapter(
            child: Text(
              S.of(context).courseLoadedContentDuration(_course.duration),
              style: T.titleSmall(context),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),

          SliverToBoxAdapter(
            child: Text(
              S
                  .of(context)
                  .courseLoadedContentLessonsCount(_course.lessons.length),
              style: T.titleSmall(context),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),

          if (_manager != null) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200.0,
                    child: FlickVideoPlayer(flickManager: _manager),
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
          ],

          SliverToBoxAdapter(
            child: Text(_course.description, style: T.bodyMedium(context)),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),

          SliverList.separated(
            itemBuilder: (_, index) => CourseLessonCard(
              route: widget.route,
              lesson: _course.lessons[index],
            ),
            separatorBuilder: (_, _) => const SizedBox(height: 8.0),
            itemCount: _course.lessons.length,
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
        ],
      ),
    );
  }
}
