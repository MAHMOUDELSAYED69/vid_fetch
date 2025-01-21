import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vid_fetch/core/utils/constants/images.dart';
import 'package:vid_fetch/core/utils/extension/extension.dart';

import '../viewmodel/download_provider.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _openKeyboard();
  }

  void _openKeyboard() {
    if (Platform.isAndroid) {
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  late TextEditingController _controller;

  Future<void> _pasteFromClipboard() async {
    ClipboardData? data = await Clipboard.getData('text/plain');
    if (data != null) {
      setState(() {
        _controller.text = data.text ?? '';
      });
    }
  }

  final FocusNode _focusNode = FocusNode();
  late GlobalKey<FormState> _formKey;
  String? _url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Consumer(
              builder: (context, ref, child) {
                final downloadState = ref.watch(downloadStateProvider);
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(ImageManager.logo, width: 60.w),
                        const SizedBox(width: 5),
                        Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text("Vid Fetch",
                                style: context.textTheme.bodyLarge)),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(ImageManager.youtube, width: 130.w),
                        SizedBox(width: 20.w),
                        Image.asset(ImageManager.shorts, width: 130.w),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Text(
                      "Youtube Video Downloader",
                      style: context.textTheme.bodyLarge,
                    ),
                    if (downloadState.isAudioDownloading &&
                        downloadState.isVideoDownloading)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          'Both Video and Audio are downloading',
                          style: context.textTheme.displayMedium,
                        ),
                      )
                    else if (downloadState.isVideoDownloading ||
                        downloadState.isAudioDownloading)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          downloadState.message!,
                          style: context.textTheme.displayMedium,
                        ),
                      )
                    else if (downloadState.isDownloadDone)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          downloadState.message!,
                          style: context.textTheme.displayMedium,
                        ),
                      ),
                    SizedBox(height: 20.h),
                    Form(
                      key: _formKey,
                      
                      child: MyTextFormField(
                        controller: _controller,
                        pasteLink: _pasteFromClipboard,
                        focusNode: _focusNode,
                        onSaved: (data) {
                          _url = data;
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    MyElevatedButton(
                      isDisabled: downloadState.isVideoDownloading,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState!.save();
                          log("$_url");

                          ref
                              .read(downloadStateProvider.notifier)
                              .downloadVideo(_url!);
                        }
                      },
                      title: "Download Video",
                    ),
                    SizedBox(height: 20.h),
                    MyElevatedButton(
                      isDisabled: downloadState.isAudioDownloading,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState!.save();
                          log("$_url");

                          ref
                              .read(downloadStateProvider.notifier)
                              .downloadAudio(_url!);
                        }
                      },
                      title: "Download Audio",
                    ),
                    SizedBox(height: 20.h),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
