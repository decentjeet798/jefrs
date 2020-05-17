import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../config/styles.dart';
import '../../widgets/appBar.dart';

class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars().appBar(
        "View us",
        // [
        //   IconButton(
        //     icon: Icon(Icons.file_download),
        //     onPressed: null,
        //   ),
        // ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            autoSpacing: true,
            swipeHorizontal: true,
            pageSnap: true,
            onError: (e) {
              print(e);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
            onPageChanged: (int page, int total) {
              setState(() {
                _currentPage = page;
              });
            },
          ),
          !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage(),
          Positioned(
            bottom: 40,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _currentPage > 0
                    ? Material(
                        borderRadius: BorderRadius.circular(5),
                        color: AppTheme.facebook,
                        elevation: 2,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Metropolis',
                          fontSize: MediaQuery.of(context).size.height * 2,
                        ),
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            _currentPage -= 1;
                            _pdfViewController.setPage(_currentPage);
                          },
                        ),
                      )
                    : Offstage(),
                _currentPage < _totalPages - 1
                    ? Material(
                        borderRadius: BorderRadius.circular(5),
                        color: AppTheme.facebook,
                        elevation: 2,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Metropolis',
                          fontSize: MediaQuery.of(context).size.height * 2,
                        ),
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            _currentPage += 1;
                            _pdfViewController.setPage(_currentPage);
                          },
                        ),
                      )
                    : Offstage()
              ],
            ),
          )
        ],
      ),
    );
  }
}
