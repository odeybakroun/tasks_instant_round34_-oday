<<<<<<< HEAD
import 'package:task2/task2.dart' as r34_09;
void main(List<String> arguments) {
 }

=======
 void main(List<String> arguments) {
   print(solution1(numbers: [5, 2, 7, 4, 9], count: 5));
 }
/// new **
>>>>>>> 6e21a990b959389918cb9f53b90e019b31963caa
// for a = [5,2,7,4,9] and k =5 ,result =3;
int? solution1({required List<int> numbers, required int count}) {
  if (numbers.isEmpty) return null;

  int bignum = numbers.reduce((a, b) => a > b ? a : b);

  int reso = 0;

  for (int i = bignum; i > 0; i--) {
    int test = 0;

    for (int j = 0; j < numbers.length; j++) {
      double result = numbers[j] / i;
      int result2 = result.toInt();

      test += result2;

      if (count == test) {
        reso = i;
        if (numbers.contains(i)) {
          return reso;
        }
      }
    }
  }
  print('your count is not exist');

  return null;
}
