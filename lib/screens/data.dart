class Property {
  String label;
  String name;
  String number;
  String price;
  String location;
  String sqm;
  String review;
  String description;
  String frontImage;
  String ownerImage;
  List<String> images;

  Property(
      this.label,
      this.name,
      this.number,
      this.price,
      this.location,
      this.sqm,
      this.review,
      this.description,
      this.frontImage,
      this.ownerImage,
      this.images);
}

List<Property> getPropertyList() {
  return <Property>[
    Property(
      "SALE",
      "Clinton Villa",
      'tel:9876543210',
      "3,500.00",
      "Los Angeles",
      "2,456",
      "4.4",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/house_01.jpg",
      "assets/owner.jpg",
      [
        "assets/kitchen.jpg",
        "assets/bath_room.jpg",
        "assets/swimming_pool.jpg",
        "assets/bed_room.jpg",
        "assets/living_room.jpg",
      ],
    ),
    Property(
      "RENT",
      "Salu House",
      'tel:9876543210',
      "3,500.00",
      "Miami",
      "3,300",
      "4.6",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/house_04.jpg",
      "assets/owner.jpg",
      [
        "assets/kitchen.jpg",
        "assets/bath_room.jpg",
        "assets/swimming_pool.jpg",
        "assets/bed_room.jpg",
        "asset/living_room.jpg",
      ],
    ),
    Property(
      "RENT",
      "Hilton House",
      'tel:9876543210',
      "3,100.00",
      "California",
      "2,100",
      "4.1",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/house_02.jpg",
      "assets/owner.jpg",
      [
        "assets/kitchen.jpg",
        "assets/bath_room.jpg",
        "assets/swimming_pool.jpg",
        "assets/bed_room.jpg",
        "assets/living_room.jpg",
      ],
    ),
    Property(
      "SALE",
      "Ibe House",
      'tel:9876543210',
      "4,500.00",
      "Florida",
      "4,100",
      "4.5",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/house_03.jpg",
      "assets/owner.jpg",
      [
        "assets/kitchen.jpg",
        "assets/bath_room.jpg",
        "assets/swimming_pool.jpg",
        "assets/bed_room.jpg",
        "assets/living_room.jpg",
      ],
    ),
    Property(
      "SALE",
      "Aventura",
      'tel:9876543210',
      "5,200.00",
      "New York",
      "3,100",
      "4.2",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/house_05.jpg",
      "assets/owner.jpg",
      [
        "assets/kitchen.jpg",
        "assets/bath_room.jpg",
        "assets/swimming_pool.jpg",
        "assets/bed_room.jpg",
        "assets/living_room.jpg",
      ],
    ),
    Property(
      "SALE",
      "North House",
      'tel:9876543210',
      "3,500.00",
      "Florida",
      "3,700",
      "4.0",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/house_06.jpg",
      "assets/owner.jpg",
      [
        "assets/kitchen.jpg",
        "assets/bath_room.jpg",
        "assets/swimming_pool.jpg",
        "assets/bed_room.jpg",
        "assets/living_room.jpg",
      ],
    ),
    Property(
      "RENT",
      "Rasmus Resident",
      'tel:9876543210',
      "2,900.00",
      "Detroit",
      "2,700",
      "4.3",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/house_07.jpg",
      "assets/owner.jpg",
      [
        "assets/kitchen.jpg",
        "assets/bath_room.jpg",
        "assets/swimming_pool.jpg",
        "assets/bed_room.jpg",
        "assets/living_room.jpg",
      ],
    ),
    Property(
      "RENT",
      "Simone House",
      'tel:9876543210',
      "3,900.00",
      "Florida",
      "3,700",
      "4.4",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/house_08.jpg",
      "assets/owner.jpg",
      [
        "assets/kitchen.jpg",
        "assets/bath_room.jpg",
        "assets/swimming_pool.jpg",
        "assets/bed_room.jpg",
        "assets/living_room.jpg",
      ],
    ),
  ];
}
