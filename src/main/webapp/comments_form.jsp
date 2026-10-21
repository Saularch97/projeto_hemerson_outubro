<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Gestão de Comentários</title>
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
</head>
<body>
	<div class="container">
		<div class="row mt-3">
			<div class="col-md-2"></div>

			<div class="col-md-8">
				<h1>Cadastro de Comentário</h1>

				<form action="/facebook/comments/save"
				      method="GET"
				      class="">

				      <input type="hidden"
				             id="comment_id_id"
				             name="comment_id"
				             value="${comment.getId()}">

				      <div class="mb-3">
				      	<label for="comment_content_id"
				      	       class="form-label">
				      	       Comentário
				      	</label>
				      	<textarea id="comment_content_id"
				      	          name="comment_content"
				      	          class="form-control"
				      	          rows="3"
				      	          required><c:out value="${comment.getContent()}" /></textarea>
				      </div>

				      <div class="mb-3">
				      	<label for="comment_post_id_id"
				      	       class="form-label">
				      	       Post
				      	</label>
				      	<select id="comment_post_id_id"
				      	        name="comment_post_id"
				      	        class="form-select"
				      	        required>
				      		<option value="">Selecione o post</option>
				      		<c:forEach var="post" items="${posts_list}">
				      			<option value="${post.getId()}"
				      			        ${comment.getPost().getId() == post.getId() ? "selected" : ""}>
				      				#${post.getId()} - <c:out value="${post.getContent()}" />
				      			</option>
				      		</c:forEach>
				      	</select>
				      </div>

				      <div class="mb-3">
				      	<label for="comment_user_id_id"
				      	       class="form-label">
				      	       Usuário
				      	</label>
				      	<select id="comment_user_id_id"
				      	        name="comment_user_id"
				      	        class="form-select"
				      	        required>
				      		<option value="">Selecione o usuário</option>
				      		<c:forEach var="usuario" items="${users_list}">
				      			<option value="${usuario.getId()}"
				      			        ${comment.getUser().getId() == usuario.getId() ? "selected" : ""}>
				      				<c:out value="${usuario.getName()}" />
				      			</option>
				      		</c:forEach>
				      	</select>
				      </div>

					  <button type="submit"
					          class="btn btn-primary">
					  	Salvar
					  </button>
					  <a href="${pageContext.request.contextPath}/comments"
					     class="btn btn-secondary">
					  	Cancelar
					  </a>
				</form>
			</div>

			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>
