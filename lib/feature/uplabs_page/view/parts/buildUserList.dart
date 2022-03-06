part of uplabs_view;

Container _buildUserList(double height, double width, List<Datum>? userlist) {
  return Container(
    padding: EdgeInsets.only(top: 5),
    margin: EdgeInsets.only(bottom: 10),
    height: height / 8,
    width: width,
    child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        itemCount: userlist?.length,
        itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8, left: 8, right: 20),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        //11
                        image: DecorationImage(
                            image: NetworkImage(
                                userlist?[index].avatar.toString() ?? ""))),
                  ),
                ),
                Text(
                  userlist?[index].firstName.toString() ?? "",
                  style: bodyText2,
                )
              ],
            )),
  );
}
