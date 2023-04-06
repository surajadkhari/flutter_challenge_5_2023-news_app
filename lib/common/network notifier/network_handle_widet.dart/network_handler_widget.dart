import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/app_images.dart';
import '../controller/network_notifier_controller.dart';



class NetworkHandler extends ConsumerWidget {
  const NetworkHandler({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final networkAware = ref.watch(networkAwareControllerProvider);

    if (networkAware == NetworkStatus.off) {
      return const NoConnectionWidget();
    }

    return widget;
  }
}

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;

    return Consumer(builder: (context, ref, child) {
      // final networkAware = ref.watch(networkAwareControllerProvider);
      // final result = ref.watch(apptermsConditionControllerProvider);
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: screenH * 0.2),
              height: screenH * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(AppImages.noNetImage),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "No Internet connection",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
            const Text("Check your connection",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.grey)),
            const Text("Please pull to refresh once connected to internet",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.grey)),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         elevation: 0, fixedSize: Size(screenW * 0.7, 0)),
            //     onPressed: () => ref.refresh(networkAwareControllerProvider),
            //     child: const Text("Refefresh"))
          ],
        ),
      );
    });
  }
}
