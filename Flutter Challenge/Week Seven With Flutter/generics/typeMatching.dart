import 'dart:async';

void main(List<String> args) {
  print(doTypesMatch(1, 2));
  print(doTypesMatch(1.3, "yryr"));
  
}

bool doTypesMatch<L, R>(L a, R b) => L == R;