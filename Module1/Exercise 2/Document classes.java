//Implementing Factory Method
//Document Interface
   //Documnet.java:
public interface Document {
    void open();
}

//Concrete Document Classes:
//Word_document:
public class WordDocument implements Document {
    @Override
    public void open() {
        System.out.println("Opening Word document...");
    }
}

//PdfDocumnet:
public class PdfDocument implements Document {
    @Override
    public void open() {
        System.out.println("Opening PDF document...");
    }
}

//Exceldocumnet:
public class ExcelDocument implements Document {
    @Override
    public void open() {
        System.out.println("Opening Excel spreadsheet...");
    }
}


    
