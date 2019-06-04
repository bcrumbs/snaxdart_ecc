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
