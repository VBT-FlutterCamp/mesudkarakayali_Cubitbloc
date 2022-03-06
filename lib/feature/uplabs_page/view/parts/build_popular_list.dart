part of uplabs_view;

Container _buildPopularList(double height, double width,
    List<PopularTitleModel?> popularlist, List<Datum>? userlist) {
  return Container(
    color: Colors.black,
    child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          PopularTitleModel? data = popularlist[index];
          return Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(right: 5),
                  height: height / 8,
                  width: width * 7 / 18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              UplabsUrl.videourl + index.toString()))),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.yellow,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: width * 10 / 18,
                        child: AutoSizeText(
                          data?.title.toString() ?? "",
                          style: bodyText1,
                        )),
                    Container(
                      width: width * 10 / 20,
                      //color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${userlist?[index].firstName.toString()} ${userlist?[index].lastName.toString()}",
                            style: bodyText2,
                          ),
                          Text(
                            "${index + 1} days ago",
                            style: bodyText2,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }),
  );
}
