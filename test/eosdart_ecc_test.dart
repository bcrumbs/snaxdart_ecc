import 'package:snaxdart_ecc/snaxdart_ecc.dart';
import 'package:test/test.dart';

void main() {
  group('SNAX Key tests', () {
    test('Construct SNAX public key from string', () {
      SNAXPublicKey publicKey = SNAXPublicKey.fromString(
          'SNAX8Qi58kbERkTJC7A4gabxYU4SbrAxStJHacoke4sf6AvJyEDZXj');
      print(publicKey);

      expect('SNAX8Qi58kbERkTJC7A4gabxYU4SbrAxStJHacoke4sf6AvJyEDZXj',
          publicKey.toString());
    });

    test('Construct SNAX public key from string PUB_K1 format', () {
      SNAXPublicKey publicKey = SNAXPublicKey.fromString(
          'PUB_K1_859gxfnXyUriMgUeThh1fWv3oqcpLFyHa3TfFYC4PK2Ht7beeX');
      print(publicKey);
    });

    test('Construct SNAX private key from string', () {
      // common private key
      SNAXPrivateKey privateKey = SNAXPrivateKey.fromString(
          '5J9b3xMkbvcT6gYv2EpQ8FD4ZBjgypuNKwE1jxkd7Wd1DYzhk88');
      expect('SNAX8Qi58kbERkTJC7A4gabxYU4SbrAxStJHacoke4sf6AvJyEDZXj',
          privateKey.toSNAXPublicKey().toString());
      expect('5J9b3xMkbvcT6gYv2EpQ8FD4ZBjgypuNKwE1jxkd7Wd1DYzhk88',
          privateKey.toString());
    });

    test('Invalid SNAX private key', () {
      try {
        SNAXPrivateKey.fromString(
            '5KYZdUEo39z3FPrtuX2QbbwGnNP5zTd7yyr2SC1j299sBCnWjsm');
        fail('Should be invalid private key');
      } on InvalidKey {} catch (e) {
        fail('Should throw InvalidKey exception');
      }
    });

    test('Construct random SNAX private key from seed', () {
      SNAXPrivateKey privateKey = SNAXPrivateKey.fromSeed('abc');
      print(privateKey);
      print(privateKey.toSNAXPublicKey());

      SNAXPrivateKey privateKey2 =
          SNAXPrivateKey.fromString(privateKey.toString());
      expect(privateKey.toSNAXPublicKey().toString(),
          privateKey2.toSNAXPublicKey().toString());
    });

    test('Construct random SNAX private key', () {
      SNAXPrivateKey privateKey = SNAXPrivateKey.fromRandom();

      print(privateKey);
      print(privateKey.toSNAXPublicKey());

      SNAXPrivateKey privateKey2 =
          SNAXPrivateKey.fromString(privateKey.toString());
      expect(privateKey.toSNAXPublicKey().toString(),
          privateKey2.toSNAXPublicKey().toString());
    });

    test('Construct SNAX private key from string in PVT format', () {
      // PVT private key
      SNAXPrivateKey privateKey2 = SNAXPrivateKey.fromString(
          'PVT_K1_2jH3nnhxhR3zPUcsKaWWZC9ZmZAnKm3GAnFD1xynGJE1Znuvjd');
      print(privateKey2);
    });

    test('Construct SNAX private key from string with compress flag', () {
      // Compressed private key
      SNAXPrivateKey privateKey3 = SNAXPrivateKey.fromString(
          'L5TCkLizyYqjvKSy6jg1XM3Lc4uTDwwvHS2BYatyXSyoS8T5kC2z');
      print(privateKey3);
    });
  });
}
