class Category{
  String planet = "Planet";
  String art = "Art";
  String handicrafts = "Handicrafts";
  String knitted = "Knitted";
  String clothesAndBags = "ClothesAndBags";
  String accessories = "Accessories";
}

class Status {
  String accepted = "Accepted";
  String refused = "Refused";
  String stock = "Stock";
  String waiting = "Waiting";
  String received = "Received";
  String shipping = "Shipping";
}

class MySize {
  String s = "S,";
  String m = "M,";
  String l = "L,";
  String xl = "XL,";
  String xxl = "XXL,";
}

// class Category{
//
//   String stringToEnumConverter(MyCategory category){
//     switch(category){
//       case MyCategory.Accessories : {
//         return "Accessories";
//       }
//       break;
//       case MyCategory.ClothesAndBags : {
//         return "ClothesAndBags";
//       }
//       break;
//       case MyCategory.Art : {
//         return "Art";
//       }
//       break;
//       case MyCategory.Handicrafts : {
//         return "Handicrafts";
//       }
//       break;
//       case MyCategory.Knitted : {
//         return "Knitted";
//       }
//       break;
//       default : {
//         return "Planet";
//       }
//     }
//   }
//
//   MyCategory enumToStringConverter(String category){
//     switch(category){
//       case "Accessories" : {
//         return MyCategory.Accessories;
//       }
//       break;
//       case "ClothesAndBags" : {
//         return  MyCategory.ClothesAndBags;
//       }
//       break;
//       case "Art" : {
//         return  MyCategory.Art;
//       }
//       break;
//       case "Handicrafts" : {
//         return MyCategory.Handicrafts;
//       }
//       break;
//       case "Knitted" : {
//         return MyCategory.Knitted;
//       }
//       break;
//       default : {
//         return MyCategory.Planet;
//       }
//     }
//   }
//
// }
//
