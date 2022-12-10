import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key? key,
    required this.checkoutId,
    required this.user,
    required this.stories,
    required this.onDone,
  }) : super(key: key);

  final String checkoutId;
  final User user;
  final List<Document> stories;
  final Function() onDone;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late WebViewPlusController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Buy Now',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: WebViewPlus(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl:
              'assets/checkout_toolkit/checkout.html?id=${widget.checkoutId}',
          onWebViewCreated: (controller) {
            this.controller = controller;

            // loadLocalHtml();
          },
          onPageFinished: (msg) {
            print('finished');
          },
          javascriptChannels: {
            JavascriptChannel(
              name: 'JavascriptChannel',
              onMessageReceived: (message) async {
                print('JS: ${message.message}');

                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => PaymentCompletePage(
                      paymentStatus: message.message,
                      checkoutId: widget.checkoutId,
                      user: widget.user,
                      stories: widget.stories,
                    ),
                  ),
                );

                widget.onDone();
              },
            )
          },
        ),
      ),
    );
  }
}
