<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, todo.model.Todo"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Todo管理</title>

<link rel="stylesheet" href="css/style.css">

</head>

	<body>
	
		<div class="container">
	
			<h1>Todo管理</h1>
	
			<div class="input-area">
	
				<form action="TodoServlet" method="post">
	
					<input type="hidden" name="action" value="add"> <input
						type="text" name="todo" placeholder="Todoを入力" required> <input
						type="date" name="deadline">
	
					<button type="submit">追加</button>
	
				</form>
	
			</div>
	
			<%
			List<Todo> todoList = (List<Todo>) request.getAttribute("todoList");
	
			int incomplete = 0;
			int complete = 0;
	
			if (todoList != null) {
				for (Todo t : todoList) {
					if (t.isCompleted()) {
				complete++;
					} else {
				incomplete++;
					}
				}
			}
			%>
	
			<div class="todo-board">
	
				<!-- 未完了 -->
	
				<div class="todo-column">
	
					<h2>
						未完了 (<%=incomplete%>)
					</h2>
	
					<%
					if (todoList != null) {
	
						for (int i = 0; i < todoList.size(); i++) {
	
							Todo todo = todoList.get(i);
	
							if (!todo.isCompleted()) {
					%>
	
					<div class="todo-item">
	
						<div class="todo-top">
	
							<form action="TodoServlet" method="post">
	
								<input type="hidden" name="action" value="toggle"> <input
									type="hidden" name="index" value="<%=i%>"> <input
									type="checkbox" onchange="this.form.submit()">
	
							</form>
	
							<span class="todo-title"> <%=todo.getTitle()%>
							</span>
	
							<form action="TodoServlet" method="post">
	
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="index" value="<%=i%>">
	
								<button class="delete-btn">削除</button>
	
							</form>
	
						</div>
	
						<div class="todo-date">
							期限:
							<%=todo.getDeadline()%>
						</div>
	
					</div>
	
					<%
	}
	}
	}
	%>
	
				</div>
	
				<!-- 完了 -->
	
				<div class="todo-column">
	
					<h2>
						完了 (<%=complete%>)
					</h2>
	
					<%
					if (todoList != null) {
	
						for (int i = 0; i < todoList.size(); i++) {
	
							Todo todo = todoList.get(i);
	
							if (todo.isCompleted()) {
					%>
	
					<div class="todo-item completed">
	
						<div class="todo-top">
	
							<form action="TodoServlet" method="post">
	
								<input type="hidden" name="action" value="toggle"> <input
									type="hidden" name="index" value="<%=i%>"> <input
									type="checkbox" checked onchange="this.form.submit()">
	
							</form>
	
							<span class="todo-title"> <%=todo.getTitle()%>
							</span>
	
							<form action="TodoServlet" method="post">
	
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="index" value="<%=i%>">
	
								<button class="delete-btn">削除</button>
	
							</form>
	
						</div>
	
						<div class="todo-date">
							期限:
							<%=todo.getDeadline()%>
						</div>
	
					</div>
	
					<%
	}
	}
	}
	%>
	
				</div>
	
			</div>
	
		</div>
	
	</body>
	
</html>