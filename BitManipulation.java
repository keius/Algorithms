import java.util.ArrayList;

public class BitManipulation {
  public static void main(String[] args) {
    ArrayList<Integer> seq = getAlternatingSequences(175);
    System.out.println(findLongestSequence(seq));
  }
  public static ArrayList<Integer> getAlternatingSequences(int n) {
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

  public static int findLongestSequence(ArrayList<Integer> seq) {
    int maxSeq = 1;

    for (int i = 0; i < seq.size(); i += 2) {
      int zerosSeq = seq.get(i);
      int onesSeqRight = i - 1 >= 0 ? seq.get(i - 1) : 0;
      int onesSeqLeft = i + 1 < seq.size() ? seq.get(i + 1) : 0;

      int thisSeq = 0;
      if (zerosSeq == 1) {
        thisSeq = onesSeqRight + 1 + onesSeqLeft;
      } if (zerosSeq > 1) {
        thisSeq = 1 + Math.max(onesSeqRight, onesSeqLeft);
      } if (zerosSeq == 0) {
        thisSeq = Math.max(onesSeqRight, onesSeqLeft);
      }
      maxSeq = Math.max(thisSeq, maxSeq);
    }

    return maxSeq;
  }
}
