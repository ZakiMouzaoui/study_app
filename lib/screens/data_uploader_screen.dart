import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/data_uploader.dart';
import 'package:study_app/firebase_ref/loading_status.dart';


class DataUploaderScreen extends StatelessWidget {
  const DataUploaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataUploader = Get.put(DataUploader(context: context));
    return Scaffold(
      body: GetBuilder<DataUploader>(
        builder: (_) => _dataUploader.loadingStatus == LoadingStatus.loading
          ? Center(child: CircularProgressIndicator()) : Center(
          child: Text(_dataUploader.questionPapers.length.toString()),
        ),
      ),
    );
  }
}
