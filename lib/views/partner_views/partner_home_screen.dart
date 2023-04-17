import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:totel/utils/app_colors.dart';
import 'package:totel/utils/app_fonts.dart';
import 'package:totel/utils/app_images.dart';
import 'package:totel/utils/enums.dart';

import '../../utils/helper.dart';

class PartnerHomeScreen extends StatefulWidget {
  const PartnerHomeScreen({super.key});

  @override
  State<PartnerHomeScreen> createState() => _PartnerHomeScreenState();
}

class _PartnerHomeScreenState extends State<PartnerHomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final selectedFilter = ValueNotifier<SearchType>(SearchType.all);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.grayColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            shadowColor: AppColors.whiteColor,
            backgroundColor: AppColors.whiteColor,
            title: const HomeAppBarIcons(),
            bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(41.8 * screenSize.flipped.aspectRatio),
              child: FilterWidget(
                selectedFilter: selectedFilter,
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle.light,
            pinned: true,
            floating: true,
            snap: true,
            automaticallyImplyLeading: false,
            forceElevated: false,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final images = HelperClass.userImages[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage(images),
                      ),
                      SizedBox(height: 5 * screenSize.flipped.aspectRatio),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Alex Norman",
                                style: AppFonts.titleStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                  width: 5 * screenSize.flipped.aspectRatio),
                              Image(
                                image: const AssetImage(
                                  AppImages.checkIcon,
                                ),
                                height: 8 * screenSize.flipped.aspectRatio,
                              ),
                            ],
                          ),
                          const Icon(Icons.more_horiz)
                        ],
                      ),
                      SizedBox(height: 3 * screenSize.flipped.aspectRatio),
                      Text(
                        "Great Western Dockyard, Gas Ferry Rd, Bristol BS1 6TY",
                        style: AppFonts.bodyStyle.copyWith(
                          color: AppColors.blackColor.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(height: 3 * screenSize.flipped.aspectRatio),
                      Text(
                        "Looking Places: Bristol, Bath & London",
                        style: AppFonts.bodyStyle.copyWith(),
                      ),
                      Text(
                        "Available from 20th March, 2023",
                        style: AppFonts.bodyStyle.copyWith(
                          color: AppColors.blackColor.withOpacity(0.5),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Budget \$650-\$800",
                            style: AppFonts.bodyStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              textStyle: AppFonts.smallBodyStyle.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                              foregroundColor:
                                  AppColors.blackColor.withOpacity(.5),
                              backgroundColor: AppColors.grayColor,
                              elevation: 0,
                            ),
                            onPressed: null,
                            child: const Text("Unavailable"),
                          ),
                        ],
                      ),
                      SizedBox(height: 3 * screenSize.flipped.aspectRatio),
                    ],
                  ),
                );
              },
              childCount: HelperClass.userImages.length,
            ),
          ),
        ],
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.selectedFilter,
  });

  final ValueNotifier<SearchType> selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: const EdgeInsets.all(20),
      child: ValueListenableBuilder(
        valueListenable: selectedFilter,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: AppFonts.smallBodyStyle.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  foregroundColor: selectedFilter.value == SearchType.all
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                  backgroundColor: selectedFilter.value == SearchType.all
                      ? AppColors.indigoColor
                      : AppColors.grayColor,
                  elevation: selectedFilter.value == SearchType.all ? 2 : 0,
                ),
                onPressed: () {
                  selectedFilter.value = SearchType.all;
                },
                child: const Text("All"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: AppFonts.smallBodyStyle.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  foregroundColor:
                      selectedFilter.value == SearchType.alreadyBooked
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                  backgroundColor:
                      selectedFilter.value == SearchType.alreadyBooked
                          ? AppColors.indigoColor
                          : AppColors.grayColor,
                  elevation:
                      selectedFilter.value == SearchType.alreadyBooked ? 2 : 0,
                ),
                onPressed: () {
                  selectedFilter.value = SearchType.alreadyBooked;
                },
                child: const Text("Already Booked"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: AppFonts.smallBodyStyle.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  foregroundColor:
                      selectedFilter.value == SearchType.lookingForPartner
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                  backgroundColor:
                      selectedFilter.value == SearchType.lookingForPartner
                          ? AppColors.indigoColor
                          : AppColors.grayColor,
                  elevation:
                      selectedFilter.value == SearchType.lookingForPartner
                          ? 2
                          : 0,
                ),
                onPressed: () {
                  selectedFilter.value = SearchType.lookingForPartner;
                },
                child: const Text("Looking For Partner"),
              ),
            ],
          );
        },
      ),
    );
  }
}

class HomeAppBarIcons extends StatelessWidget {
  const HomeAppBarIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_on,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text(
              'Bristol, United Kingdom',
              style: AppFonts.titleStyle,
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.blackColor.withOpacity(.1),
              radius: 20,
              child: const Icon(
                Icons.search,
                size: 25,
              ),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: AppColors.blackColor.withOpacity(.1),
              radius: 20,
              child: const Icon(
                Icons.format_list_bulleted_outlined,
                size: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
