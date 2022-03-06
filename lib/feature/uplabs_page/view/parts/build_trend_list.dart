part of uplabs_view;

Container _buildTrendList(double height, double width,
    List<TrendTitleModel?> titleList, List<Datum>? userlist) {
  return Container(
    height: height / 4,
    margin: EdgeInsets.only(top: 5, bottom: 10),
    child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5),
            width: width * 4 / 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(UplabsUrl.trendurl +
                        "40${index.toString()}/30${index.toString()}"))),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 5, left: 5, bottom: 30),
                  height: height / 30,
                  width: width / 10,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "Live",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: width / 7,
                      height: height / 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Center(
                          child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ))),
                ),
              ),
              Container(
                // color: Colors.black,
                padding: EdgeInsets.only(top: 40),
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  color: Colors.black.withOpacity(0.3),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${userlist?[index].firstName.toString()} ${userlist?[index].lastName.toString()}",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      Text(
                        titleList[index]
                                ?.title
                                .toString()
                                .substring(0, 35)
                                .toUpperCase() ??
                            "",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          );
        }),
  );
}
