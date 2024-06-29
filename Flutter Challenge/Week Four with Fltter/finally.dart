void main() {
  try {
    breedMoreLlamas();
  } catch (e) {
    print(e);
  } finally {
    cleanLlamaStalls();
  }
}

void breedMoreLlamas() {
  throw Exception('Error breeding llamas.');
}

void cleanLlamaStalls() {
  print('Cleaning llama stalls.');
}
