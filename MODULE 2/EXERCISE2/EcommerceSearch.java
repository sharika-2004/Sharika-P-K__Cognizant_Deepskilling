//Product Class

class Product {
    int productId;
    String productName;
    String category;

    Product(int productId, String productName, String category) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }

    void display() {
        System.out.println(productId + " " + productName + " " + category);
    }
}

//linear Search
class LinearSearch {

    public static Product search(Product[] products, int key) {

        for (Product p : products) {
            if (p.productId == key) {
                return p;
            }
        }

        return null;
    }
}

//Binary Search
class BinarySearch {

    public static Product search(Product[] products, int key) {

        int low = 0;
        int high = products.length - 1;

        while (low <= high) {

            int mid = (low + high) / 2;

            if (products[mid].productId == key)
                return products[mid];

            else if (products[mid].productId < key)
                low = mid + 1;

            else
                high = mid - 1;
        }

        return null;
    }
}

public class EcommerceSearch {

    public static void main(String[] args) {

        Product[] linearProducts = {
                new Product(105, "Shoes", "Fashion"),
                new Product(102, "Laptop", "Electronics"),
                new Product(108, "Phone", "Electronics"),
                new Product(101, "Watch", "Accessories"),
                new Product(110, "Bag", "Fashion")
        };

        Product[] binaryProducts = {
                new Product(101, "Watch", "Accessories"),
                new Product(102, "Laptop", "Electronics"),
                new Product(105, "Shoes", "Fashion"),
                new Product(108, "Phone", "Electronics"),
                new Product(110, "Bag", "Fashion")
        };

        int searchId = 108;

        System.out.println("Linear Search");

        Product p1 = LinearSearch.search(linearProducts, searchId);

        if (p1 != null)
            p1.display();
        else
            System.out.println("Product Not Found");

        System.out.println();

        System.out.println("Binary Search");

        Product p2 = BinarySearch.search(binaryProducts, searchId);

        if (p2 != null)
            p2.display();
        else
            System.out.println("Product Not Found");
    }
}
