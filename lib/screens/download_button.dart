import 'package:partner_flutter_app/screens/download-service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({Key key, this.url, this.filetype,this.filename}) : super(key: key);

  final String url;
  final String filetype;
  final String filename;

  Future<void> _downloadFile() async {
    DownloadService downloadService =
        kIsWeb ? WebDownloadService() : MobileDownloadService();
    await downloadService.download(url: url,filetype:filetype,filename:filename);
    print('here');
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _downloadFile,
      icon: const Icon(Icons.download),
      label: const Text('Download'),
    );
  }
}