import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:totel/utils/app_colors.dart';
import 'package:totel/utils/app_fonts.dart';
import 'package:totel/utils/enums.dart';

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
                return ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  title: Text('Item $index'),
                );
              },
              childCount: 100,
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
