public class LR22 {
    public static void main(String[] args) {
        int[] tabl = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        for (int q : tabl) {
            for (int w : tabl) {
                System.out.printf("%4d", (q * w));
            }
            System.out.println();
        }
    }
}
