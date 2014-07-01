
package com.nwice;

//Java
import java.io.File;
import java.io.OutputStream;

//JAXP
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Source;
import javax.xml.transform.Result;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.sax.SAXResult;

//FOP
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

/**
 * This class demonstrates the conversion of an XML file to PDF using 
 * JAXP (XSLT) and FOP (XSL-FO).
 */
public class Resume {

    /**
     * Main method.
     * @param args command-line arguments
     */
	
	public static void doit(String dirPrefix, String xml, String xsl, String output) throws Exception {
        // Setup directories
        File baseDir = new File(".");
        File outDir = new File(baseDir, "out");
        File xmlDir = new File(baseDir, "in/" + dirPrefix);
        outDir.mkdirs();

        // Setup input and output files            
        File xmlfile = new File(xmlDir, xml);
        File xsltfile = new File(xmlDir, xsl);
        File pdffile = new File(outDir, output);
        System.out.println("Input: XML (" + xmlfile + ")");
        System.out.println("Stylesheet: " + xsltfile);
        System.out.println("Output: PDF (" + pdffile + ")");
        System.out.println();
        System.out.println("Transforming...");
        
        FopFactory fopFactory = FopFactory.newInstance();

        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();

        OutputStream out = new java.io.FileOutputStream(pdffile);
        out = new java.io.BufferedOutputStream(out);
        
        try {
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xsltfile));
            
            // Set the value of a <param> in the stylesheet
            //transformer.setParameter("versionParam", "2.0");
        
            // Setup input for XSLT transformation
            Source src = new StreamSource(xmlfile);
        
            // Resulting SAX events (the generated FO) must be piped through to FOP
            Result res = new SAXResult(fop.getDefaultHandler());

            // Start XSLT transformation and FOP processing
            transformer.transform(src, res);
        } finally {
            out.close();
        }
        
        System.out.println("Success!");		
	}
	
    public static void main(String[] args) {
        try {
            System.out.println("FOP ExampleXML2PDF\n");
            System.out.println("Preparing...");

            // Setup directories
            //File baseDir = new File(".");
            //File outDir = new File(baseDir, "out");
            //outDir.mkdirs();

            doit("resume", "resume.xml","style.xsl", "Resume_of_Kevin_McIntyre.pdf");
            doit("cover", "cover.xml","style.xsl", "Cover_Letter_of_Kevin_McIntyre.pdf");
            
            // Setup input and output files            
            //File xmlfile = new File(baseDir, );
            //File xsltfile = new File(baseDir, );
            //File pdffile = new File(outDir, );
            
        } catch (Exception e) {
            e.printStackTrace(System.err);
            System.exit(-1);
        }
    }
}
