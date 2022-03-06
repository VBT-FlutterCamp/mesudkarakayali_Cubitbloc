part of uplabs_view;

AppBar _buildAppBar() {
  return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        UplabsViewString.title,
        style: TextStyle(fontSize: 28, color: Colors.white),
      ),
      actions: [
        Icon(
          Icons.search,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: CircleAvatar(
            child: Image.network(UplabsUrl.url),
          ),
        )
      ]);
}
