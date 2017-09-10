import java.util.ArrayList;

public class BitManipulation {

  ArrayList<Integer> getAlternatingSequences(int n) {
    ArrayList<Integer> sequences = new ArrayList<Integer>();

    int searchingFor = 0;
    int counter = 0;

    for (int i = 0; i < Integer.BYTES * 8; i++) {
      if ((n & 1) != searchingFor) {
        sequences.add(counter);
        searchingFor = n & 1;
        counter = 0;
      }

      counter++;
      n >>>= 1;
    }

    sequences.add(counter);

    return sequences;
  }

  Integer.BYTES * 8
}
