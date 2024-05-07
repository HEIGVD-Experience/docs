package ch.heigvd.cld.lab;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

@WebServlet(name = "DatastoreWrite", value = "/datastorewrite")
public class DatastoreWrite extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        if (req.getParameterMap().containsKey("_kind")) {
            try {
                DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

                Entity entity = new Entity(req.getParameter("_kind"));

                Enumeration<String> parameterNames = req.getParameterNames();

                while (parameterNames.hasMoreElements()) {
                    String paramName = parameterNames.nextElement();
                    String paramValue = req.getParameter(paramName);
                    if(!paramName.equals("_kind")) {
                        entity.setProperty(paramName, paramValue);
                    }
                }

                resp.setContentType("text/plain");
                PrintWriter pw = resp.getWriter();
                pw.println("Writing entity to datastore. \nKind: " + entity.getKind());

                datastore.put(entity);
            } catch (Exception e) {
                throw new RuntimeException("An error occurred while processing your request.");
            }
        } else {
            throw new RuntimeException("Your parameters should contain a parameter called _kind.");
        }
    }
}