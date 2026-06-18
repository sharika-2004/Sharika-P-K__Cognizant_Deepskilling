Test the singleton Implementation:
    public class Main {
    public static void main(String[] args) {
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();

        logger1.log("Application started.");
        logger2.log("Performing database operation.");

        System.out.println("\n--- Verification ---");
        System.out.println("Logger 1 HashCode: " + logger1.hashCode());
        System.out.println("Logger 2 HashCode: " + logger2.hashCode());

        if (logger1 == logger2) {
            System.out.println("\nSUCCESS: Both variables point to the exact same Logger instance.");
        } else {
            System.out.println("\nFAILURE: Multiple instances of Logger exist!");
        }
    }
}

