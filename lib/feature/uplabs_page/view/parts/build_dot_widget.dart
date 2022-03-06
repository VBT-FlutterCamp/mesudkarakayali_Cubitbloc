part of uplabs_view;

Container _buildDotWidget(
    double height, double width, List<TrendTitleModel?> trendlist) {
  return Container(
    height: height / 20,
    width: width,
    alignment: Alignment.center,
    child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          bool isequal = context.read<UplabsviewCubit>().selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: isequal ? 7 : 5,
              width: isequal ? 7 : 5,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isequal ? Colors.orange : Colors.white),
            ),
          );
        }),
  );
}
