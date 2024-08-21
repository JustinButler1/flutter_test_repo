enum ListItemType { countOnly, nestedList }

List<String> listItemTypesAsStrings() {
  return [
    "Count Only",
    "List",
    "test",
  ];
}

ListItemType listItemTypeFromString(String type) {
  switch (type) {
    case "Count Only":
      return ListItemType.countOnly;
    case "List":
      return ListItemType.nestedList;
    default:
      throw Exception("Invalid Item Type of string format: $type");
  }
}
