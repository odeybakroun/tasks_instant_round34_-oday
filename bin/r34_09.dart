 void main(List<String> arguments) {
   print(solution1(numbers: [5, 2, 7, 4, 9], count: 5));
 }
/// new **
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
