package com.aes.controller;
 
import com.aes.model.Chapter;
import com.aes.model.Presentation;
import com.aes.service.EmpireService;
import com.oreilly.servlet.MultipartRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
 
/**
 * A Java servlet that handles file upload from client.
 *
 * @author www.codejava.net
 */
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
     
    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // upload settings
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
 
    /**
     * Upon receiving file upload submission, parses the request to read
     * upload data and saves the file on disk.
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(factory);         
        upload.setFileSizeMax(MAX_FILE_SIZE);         
        upload.setSizeMax(MAX_REQUEST_SIZE);          
        Presentation tempPresentation = new Presentation();
        EmpireService service = new EmpireService();
        String chapterId = "";         
        String description = "";
        try {
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                for (FileItem item : formItems) {
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = "c:"+ File.separator + fileName;                        
                        File storeFile = new File(filePath);
                        item.write(storeFile);
                        tempPresentation.setFilePath(filePath);
                        tempPresentation.setFileSize(item.getSize());
                        tempPresentation.setFileType(item.getContentType());                        
                        tempPresentation.setFileName(fileName);
                    } else {
                        String name = item.getFieldName();
                        String value = item.getString();
                        if (name.equals("chapterId")){
                            chapterId = value;
                            //System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<" + chapterId);
                        } else {
                            description = value;
                            //System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<" + description);
                        }                        
                    }
                }
            }                        
        } catch (Exception ex) {
            
            ex.printStackTrace();
        }
                                
        tempPresentation.setRecordStatus(true);                                                
        tempPresentation.setDescription(description);      
        int id = Integer.parseInt(chapterId);
        tempPresentation.setChapter(service.getChapterById(11));        
        service.addPresentation(tempPresentation);
        
    }
    
    private static String getValue(Part part) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(part.getInputStream(), "UTF-8"));
        StringBuilder value = new StringBuilder();
        char[] buffer = new char[1024];
        for (int length = 0; (length = reader.read(buffer)) > 0;) {
            value.append(buffer, 0, length);
        }
        return value.toString();
    }
}