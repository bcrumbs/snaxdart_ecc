# Elliptic curve cryptography (ECC) in Dart

Elliptic curve cryptography lib for EOS based blockchain in Dart lang.

[![Build Status](https://travis-ci.com/primes-network/snaxdart_ecc.svg?branch=master)](https://travis-ci.com/primes-network/snaxdart_ecc)

## Usage

A simple usage example:

```dart
import 'package:snaxdart_ecc/snaxdart_ecc.dart';

main() {
  // Construct the SNAX private key from string
  SNAXPrivateKey privateKey = SNAXPrivateKey.fromString(
      '5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3');

  // Get the related SNAX public key
  SNAXPublicKey publicKey = privateKey.toSNAXPublicKey();
  // Print the SNAX public key
  print(publicKey.toString());

  // Going to sign the data
  String data = 'data';

  // Sign
  SNAXSignature signature = privateKey.signString(data);
  // Print the SNAX signature
  print(signature.toString());

  // Verify the data using the signature
  signature.verify(data, publicKey);
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

## References

eosjs-ecc: https://github.com/EOSIO/eosjs-ecc

[tracker]: https://github.com/primes-network/snaxdart_ecc/issues
