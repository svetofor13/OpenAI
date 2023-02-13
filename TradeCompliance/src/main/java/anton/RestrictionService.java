package anton;

import com.theokanning.openai.OpenAiService;
import com.theokanning.openai.completion.CompletionChoice;
import com.theokanning.openai.completion.CompletionRequest;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class RestrictionService extends HttpServlet {

    public static void main(String[] args)
    {
        String response = getImportationDocuments("a book","Canada");
        System.out.println(response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("DO POST");
        String title = req.getParameter("product-title");
        String cod = req.getParameter("country");
        boolean isRestricted = isRestricted(title,cod);
        String documents = "";
        if(isRestricted)
            documents = getImportationDocuments(title, cod);
        req.getSession().setAttribute("title",title );
        req.getSession().setAttribute("cod",cod );
        req.getSession().setAttribute("isRestricted", isRestricted);
        req.getSession().setAttribute("documents", documents);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("TradeCompliance_result.jsp");
        System.out.println(("redirecting to " + requestDispatcher.toString()));
        requestDispatcher.forward(req,resp);
        //resp.getWriter().append("TEST " + (isRestricted?"YES":"NO"));
        //resp.flushBuffer();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("product-title");
        String cod = req.getParameter("country");
        boolean iRestricted = isRestricted(title,cod);
    }

    private static boolean isRestricted(String title, String cod)
    {
        String prompt = "is '" + title + "' a type of thing that is restricted for import into " + cod + ". YES or NO";
        System.out.println("Prompt: " + prompt);
        OpenAiService service = new OpenAiService("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");
        CompletionRequest completionRequest = CompletionRequest.builder()
                .prompt(prompt)
                .model("text-davinci-003")
                .temperature(0d)
                .echo(true)
                .build();
        List<CompletionChoice> choices = service.createCompletion(completionRequest).getChoices();

        String answer = getResponse(choices);
        System.out.println("Answer: " + answer);

        return answer.toLowerCase().contains("yes");

    }

    private static String getImportationDocuments(String title, String cod)
    {
        String prompt = "Importation documents for '" + title + "' into " + cod;
        System.out.println("Prompt: " + prompt);
        OpenAiService service = new OpenAiService("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", 120);
        CompletionRequest completionRequest = CompletionRequest.builder()
                .prompt(prompt)
                .model("text-davinci-003")
                .temperature(0d)
                .maxTokens(4000)
                .echo(true)
                .build();
        List<CompletionChoice> choices = service.createCompletion(completionRequest).getChoices();

        String answer = getResponse(choices);
        System.out.println("Answer: " + answer);

        return answer;

    }

    private static String getResponse(List<CompletionChoice> choices)
    {
        return getResponse(choices.get(0));
    }
    private static String getResponse(CompletionChoice choice)
    {
        System.out.println("Response: " + choice.getText());

        StringBuffer response = new StringBuffer();

        String[] responseLines = choice.getText().split("\\n\\n");
        for(int ii=1;ii<responseLines.length;ii++)
            response.append(responseLines[ii] + "<br>");

        return response.toString();
    }

}
