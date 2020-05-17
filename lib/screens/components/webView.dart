import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../mixins/InputFieldsMixinAndSnackBar.dart';
import '../../config/styles.dart';
import '../../widgets/appBar.dart';

class WebViews extends StatefulWidget {
  final String pageName;
  final String url;

  WebViews({this.pageName, this.url});

  @override
  _WebViewsState createState() => _WebViewsState();
}

class _WebViewsState extends State<WebViews> with InputFieldsMixinAndSnackBar {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> subscription;

  bool _isLoading = true;
  bool connectionStatus = true;

  @override
  void initState() {
    super.initState();

    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        setState(() {
          connectionStatus = true;
          _isLoading = true;
        });
      } else if (result == ConnectivityResult.none) {
        setState(() {
          connectionStatus = false;
        });
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: AppBars().appBar(widget.pageName),
      body: connectionStatus
          ? Stack(
              children: <Widget>[
                WebView(
                  initialUrl: widget.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webviewController) {
                    _completer.complete(webviewController);
                  },
                  // gestureNavigationEnabled: true,
                  onPageFinished: (finish) {
                    setState(() {
                      _isLoading = false;
                    });
                  },
                ),
                _isLoading
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppTheme.facebook),
                              strokeWidth: 5,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Loading Please wait..",
                              style: TextStyle(
                                color: AppTheme.secondryColor,
                                fontFamily: 'Metropolis',
                                fontSize: height + 10,
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
              ],
            )
          : offlinePage(),
    );
  }
}
