import 'package:bloc_flutter_test_second/cubit/first_counter_cubit.dart';
import 'package:bloc_flutter_test_second/cubit/play_video_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatelessWidget {
  var cubit = FirstCounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              BlocBuilder<FirstCounterCubit, int>(
                cubit: cubit,
                builder: (_, count) {
                  return Column(
                    children: [
                      Image.asset("assets/toast.gif"),
                      Center(
                        child: Text('$count',
                            style: Theme.of(context).textTheme.headline1),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                cubit.increment();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                cubit.decrement();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  var videoCubit = PlayVideoCubit();
  var _controller = VideoPlayerController.asset('assets/preview.mp4')..initialize();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayVideoCubit, bool>(
      cubit: videoCubit,
      builder: (context, isPlaying) {
        return Column(
          children: <Widget>[
            Center(
              child: isPlaying
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            FloatingActionButton(
              onPressed: () {
                  isPlaying
                      ? videoCubit.play()
                      : videoCubit.stop();
              },
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ],
        );
      },
    );
  }
}
