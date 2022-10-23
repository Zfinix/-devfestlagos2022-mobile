import 'package:devfest/core/state/providers.dart';
import 'package:devfest/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:devfest/utils/extensions/extensions.dart';
import 'package:gap/gap.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/router/navigator.dart';

class MoreInfoPage extends HookConsumerWidget {
  const MoreInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final speakers = ref.watch(speakersVM);

    //trim venue name
    String trimmedVenue = speakers.venue.replaceAll(' ', '').toLowerCase();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                width: double.infinity,
                height: 231,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('banner'.png), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                  left: 15,
                  top: 49,
                  child: IconButton(
                    onPressed: () {
                      AppNavigator.maybePop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                    ),
                  ))
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(24),
                  Text(
                    speakers.title,
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey0),
                  ),
                  const Gap(8),
                  const Text(
                    'Venue Entrance',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey12,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    speakers.time,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey12),
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      Image.asset(
                        speakers.avatar.png,
                        width: 40,
                        height: 40,
                      ),
                      const Gap(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${speakers.firstName} ${speakers.lastName}',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey0),
                          ),
                          const Gap(4),
                          Text(
                            speakers.role,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey8),
                          )
                        ],
                      )
                    ],
                  ),
                  const Gap(16),
                  const CustomChip(
                    color: AppColors.lightRed2,
                    text: 'PENDING',
                    textColor: AppColors.redPrimary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  const Gap(24),
                  const Text(
                    'In this talk, Aise instructs all adventurers looking into Web3 and tells them how to find opportunities best suited for them.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey6),
                  ),
                  const Gap(32),
                  const Text(
                    'VENUE',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey0),
                  ),
                  const Gap(8),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 161,
                          child: Image.asset(
                            trimmedVenue.png,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        bottom: 16,
                        child: CustomChip(
                          color: AppColors.white,
                          text: speakers.venue,
                          textColor: AppColors.grey6,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  const CustomChip(
      {Key? key, this.text, this.padding, this.color, this.textColor})
      : super(key: key);

  final String? text;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      padding: padding,
      child: Text(
        text ?? '',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}
