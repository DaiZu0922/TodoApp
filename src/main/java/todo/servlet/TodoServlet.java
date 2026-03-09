package todo.servlet;

import  java.io.IOException;
import  java.time.LocalDate;
import  java.time.format.DateTimeFormatter;
import  java.util.ArrayList;
import  java.util.List;

import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import todo.model.Todo;

@WebServlet("/TodoServlet")
public class TodoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private List<Todo> todoList = new ArrayList<>();

    // 初期表示
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("todoList", todoList);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    // フォーム送信処理
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        // Todo追加
        if ("add".equals(action)) {
            String title = request.getParameter("todo");
            String deadlineStr = request.getParameter("deadline"); // 日付文字列
            LocalDate deadline = null;

            if (deadlineStr != null && !deadlineStr.isEmpty()) {
                deadline = LocalDate.parse(deadlineStr, DateTimeFormatter.ISO_DATE);
            }

            if (title != null && !title.isEmpty()) {
                todoList.add(new Todo(title, deadline));
            }
        }

        // Todo削除
        if ("delete".equals(action)) {

            int index = Integer.parseInt(request.getParameter("index"));

            todoList.remove(index);
        }

        // 完了状態切替
        if ("toggle".equals(action)) {

            int index = Integer.parseInt(request.getParameter("index"));

            todoList.get(index).toggleCompleted();
        }

        request.setAttribute("todoList", todoList);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}