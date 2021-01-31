package com.nwice;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Source;
import javax.xml.transform.Result;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.sax.SAXResult;

import lombok.extern.slf4j.Slf4j;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

@Slf4j
public class Resume {

	public static void fop(String dirPrefix, String xml, String xsl, String output) throws Exception {
        // Setup directories
        File baseDir = new File(".");
        File outDir = new File(baseDir, "out");
        File xmlDir = new File(baseDir, "in/" + dirPrefix);
        outDir.mkdirs();

        // Setup input and output files
        File xmlfile = new File(xmlDir, xml);
        File xsltfile = new File(xmlDir, xsl);
        File pdffile = new File(outDir, output);
        log.info("xml input: {}", xmlfile);
        log.info("xsl stylesheet: {}", xsltfile);
        log.info("pdf output: {}", pdffile);
        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());

        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();

        OutputStream out = new FileOutputStream(pdffile);
        out = new BufferedOutputStream(out);

        try {
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xsltfile));
            Source src = new StreamSource(xmlfile);
            Result res = new SAXResult(fop.getDefaultHandler());
            transformer.transform(src, res);
        } finally {
            out.close();
        }
	}

    public static void main(String[] args) {
        try {
            String suffix = "2021";
            fop("resume", String.format("resume_%s.xml", suffix),String.format("style_%s.xsl", suffix), "resume_of_kevin_mcintyre.pdf");
            fop("cover", String.format("cover_%s.xml", suffix),String.format("style_%s.xsl", suffix), "cover_letter_of_kevin_mcintyre.pdf");
        } catch (Exception e) {
            log.error("main exception:", e);
            System.exit(-1);
        }
    }
}
