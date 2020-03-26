class Seed {
  final String title;
  final List<String> choices;
  Seed(this.title, this.choices);
}

class SeedData {
  final List<Seed> data = [
    Seed("Should I do it now?", ["Yes", "No"]),
    Seed("What should I have for lunch?", [
      "Veg meals",
      "Chicken Biriyani",
      "Butter naan",
      "Egg fried rice",
      "Veg pulav",
      "Noodles",
      "Roti combo"
    ]),
  ];
}
