// Algorithm Used: Weighted Score Algorithm
// Created Date: 2021-02-01T10:00:00.000Z
// Original Team: Team Mapagmahal
// -----------------------------------------------------------------------------

class Store {
  String name;
  double location;
  double rating;
  double availability;
  double responseTime;
  double? score;

  Store({
    required this.name,
    required this.location,
    required this.rating,
    required this.availability,
    required this.responseTime,
  });
}

double normalize(double value, double minValue, double maxValue) {
  return (value - minValue) / (maxValue - minValue);
}

double calculateScore(Store store, List<double> weights) {
  double normalizedLocation = normalize(store.location, 0, 10);
  double normalizedRating = normalize(store.rating, 0, 5);
  double normalizedAvailability = normalize(store.availability, 0, 100);
  double normalizedResponseTime = normalize(store.responseTime, 0, 60);

  return (normalizedLocation * weights[0]) +
      (normalizedRating * weights[1]) +
      (normalizedAvailability * weights[2]) +
      (normalizedResponseTime * weights[3]);
}

void main() {
  List<Store> stores = [
    Store(
        name: 'Store A',
        location: 4,
        rating: 4.5,
        availability: 90,
        responseTime: 15),
    Store(
        name: 'Store B',
        location: 6,
        rating: 3.5,
        availability: 70,
        responseTime: 10),
    Store(
        name: 'Store C',
        location: 2,
        rating: 4.2,
        availability: 95,
        responseTime: 20),
    Store(
        name: 'Store D',
        location: 8,
        rating: 3.8,
        availability: 80,
        responseTime: 30),
  ];

  List<double> weights = [0.25, 0.35, 0.25, 0.15];

  // Calculate scores for each store
  for (var store in stores) {
    store.score = calculateScore(store, weights);
  }

  // Sort stores based on scores (highest score first)
  stores.sort((a, b) => b.score!.compareTo(a.score!));

  // Print sorted stores
  for (var store in stores) {
    print('${store.name}: ${store.score}');
  }
}
