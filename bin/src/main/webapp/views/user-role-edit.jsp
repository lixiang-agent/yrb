<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="${ctx }/updateSaveRole" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">
					<strong>修改角色</strong>
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="userId" value="${param.id }">
				<div class="row">
					<c:forEach items="${roles }" var="role" varStatus="stat">
						<div class="col_xs_6">
							<label> <input name="role" type="checkbox"
								value="${role.id }"
								<c:if test="${ not empty role.myrole}">  checked="checked" </c:if>>
								${role.roleDesc}
							</label>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default btn-sm"
					data-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary btn-sm">保存</button>
			</div>
		</div>
	</div>
</form>
