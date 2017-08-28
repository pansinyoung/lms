<%@page import="java.util.ArrayList"%>
<%@include file="include.html"%>
<%@page import="com.gcit.lms.entity.*"%>
<%@page import="com.gcit.lms.dao.*"%>
<%@page import="com.gcit.lms.service.*"%>
<%@page import="java.util.List"%>
<%
	AdminService adminService = new AdminService();
	List<Branch> branches = new ArrayList<Branch>();
	int totalPages = 1;
	int pageNo = 1;
	int pageSize = 10;
	String searchString = "Search branch!";

	if (request.getAttribute("pageNum") != null)
		pageNo = (int) request.getAttribute("pageNum");

	if (request.getAttribute("totalCount") != null)
		totalPages = (int) request.getAttribute("totalCount");

	if (request.getAttribute("pageSize") != null)
		pageSize = (int) request.getAttribute("pageSize");

	if (request.getAttribute("searchString") != null)
		searchString = (String) request.getAttribute("searchString");

	if (request.getAttribute("branches") != null) {
		branches = (List<Branch>) request.getAttribute("branches");
	} else {
		branches = adminService.readAllBranch(1, 10);
		totalPages = adminService.getAllCountBranch();
	}

	if (totalPages % pageSize > 0) {
		totalPages = totalPages / pageSize + 1;
	} else {
		totalPages = totalPages / pageSize;
	}
%>


<div class="container theme-showcase" role="main">

	<div class="jumbotron" style="background-color: #337ab7 !important;">
		<h1 align="center">Welcome Administrater</h1>
	</div>
	
	<%if(request.getAttribute("confMessage")!=null){ %>
		<h3><%=request.getAttribute("confMessage")%></h3>
		<%} %>

	<div class="page-header">
		<div class="col-md-6" align="left">
			<h1 style="font-size: 24px !important;">Please select your
				action:</h1>
		</div>

	</div>
	<div class="col-md-6" align="right">
		<form class="form-inline"
			action="searchBranch?pageNo=<%=pageNo%>&pageSize=<%=pageSize%>"
			method="get">
			<div class="row">
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="<%=searchString%>" aria-describedby="basic-addon1"
						name="searchString">
				</div>
				<div class="input-group">
					<button type="submit">Search!</button>
				</div>

			</div>
		</form>
	</div>

	<div class="row">

		<!-- Menu Block to the left side -->

		<div class="col-sm-2" align="center" style="float: left;">

			<!-- Collapsed Menu -->
			<div class="panel-group" id="accordion">
				<div class="panel panel-default panel-info">
					<div class="panel-heading">
						<h4 class="panel-title myCollapseItem myCollapseItem">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse1">Book</a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse">
						<div class="list-group">
							<a class="panel-collapse collapse">Book</a> 
							<a href="bookadd.jsp" class="list-group-item" data-toggle="modal" data-target="#bookOps">Add</a> 
							<a href="administrationBookDelete.jsp" class="list-group-item">Delete</a> 
							<a href="administrationBookUpdate.jsp" class="list-group-item">Update</a> 
							<a href="administrationBook.jsp" class="list-group-item">View</a>
						</div>
					</div>
				</div>
				<div class="panel panel-default panel-info">
					<div class="panel-heading">
						<h4 class="panel-title myCollapseItem">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse2">Author</a>
						</h4>
					</div>
					<div id="collapse2" class="panel-collapse collapse">
						<div class="list-group">
							<a class="panel-collapse collapse">Author</a> 
							<a href="authoradd.jsp" class="list-group-item" data-toggle="modal" data-target="#bookOps">Add</a> 
							<a href="administrationAuthorDelete.jsp" class="list-group-item">Delete</a> 
							<a href="administrationAuthorUpdate.jsp" class="list-group-item">Update</a> 
							<a href="administrationAuthor.jsp" class="list-group-item">View</a>
						</div>
					</div>
				</div>
				<div class="panel panel-default panel-info">
					<div class="panel-heading">
						<h4 class="panel-title myCollapseItem">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse3">Publisher</a>
						</h4>
					</div>
					<div id="collapse3" class="panel-collapse collapse">
						<div class="list-group">
							<a class="panel-collapse collapse">Publisher</a> 
							<a href="publisheradd.jsp" class="list-group-item" data-toggle="modal" data-target="#bookOps">Add</a> 
							<a href="administrationPublisherDelete.jsp" class="list-group-item">Delete</a> 
							<a href="administrationPublisherUpdate.jsp" class="list-group-item">Update</a> 
							<a href="administrationPublisher.jsp" class="list-group-item">View</a>
						</div>
					</div>
				</div>
				<div class="panel panel-default panel-info">
					<div class="panel-heading">
						<h4 class="panel-title myCollapseItem">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse4">Branch</a>
						</h4>
					</div>
					<div id="collapse4" class="panel-collapse collapse in">
						<div class="list-group">
							<a class="panel-collapse collapse">Branch</a> 
							<a href="branchadd.jsp" class="list-group-item" data-toggle="modal" data-target="#bookOps">Add</a> 
							<a href="administrationBranchDelete.jsp" class="list-group-item">Delete</a> 
							<a href="administrationBranchUpdate.jsp" class="list-group-item">Update</a> 
							<a href="administrationBranch.jsp" class="list-group-item">View</a>
						</div>
					</div>
				</div>
				<div class="panel panel-default panel-info">
					<div class="panel-heading">
						<h4 class="panel-title myCollapseItem">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse5">Borrower</a>
						</h4>
					</div>
					<div id="collapse5" class="panel-collapse collapse">
						<div class="list-group">
							<a class="panel-collapse collapse">Borrower</a> 
							<a href="borroweradd.jsp" class="list-group-item" data-toggle="modal" data-target="#bookOps">Add</a> 
							<a href="administrationBorrowerDelete.jsp" class="list-group-item">Delete</a> 
							<a href="administrationBorrowerUpdate.jsp" class="list-group-item">Update</a> 
							<a href="administrationBorrower.jsp" class="list-group-item">View</a>
						</div>
					</div>
				</div>
				<div class="panel panel-default panel-info">
					<div class="panel-heading">
						<h4 class="panel-title myCollapseItem">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse6">Genre</a>
						</h4>
					</div>
					<div id="collapse6" class="panel-collapse collapse">
						<div class="list-group">
							<a class="panel-collapse collapse">Genre</a> 
							<a href="genreadd.jsp" class="list-group-item" data-toggle="modal" data-target="#bookOps">Add</a> 
							<a href="administrationGenreDelete.jsp" class="list-group-item">Delete</a> 
							<a href="administrationGenreUpdate.jsp" class="list-group-item">Update</a> 
							<a href="administrationGenre.jsp" class="list-group-item">View</a>
						</div>
					</div>
				</div>
				<div class="panel panel-default panel-info">
					<div class="panel-heading">
						<h4 class="panel-title myCollapseItem">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse7">Loan</a>
						</h4>
					</div>
					<div id="collapse7" class="panel-collapse collapse">
						<div class="list-group">
							<a class="panel-collapse collapse">Loan</a> 
							<a href="administrationLoanOverride.jsp" class="list-group-item">Override Due</a> 
							<a href="administrationLoan.jsp" class="list-group-item">View</a>
						</div>
					</div>
				</div>


			</div>

		</div>

		<!-- End Menu Block to the left side -->


		<!-- 	BooK Table on the right -->
		<div class="col-lg-10" align="center" style="float: right;">

			<table class="table table-striped" style="text-align: center;">
				<tr style="text-align: center;">
					<th style="text-align: center;">#</th>
					<th style="text-align: center;">Branch Name</th>
					<th style="text-align: center;">Branch Address</th>
					<th style="text-align: center;">Delete</th>
				<%
					for (Branch b : branches) {
				%>
				<tr>
					<td><%=branches.indexOf(b) + 1%></td>

					<td><%=b.getBranchName()%></td>
					
					<td><%=b.getBranchAddr()%></td>

					<td><button class="btn btn-sm btn-danger" onclick="javascript:location.href='administrationBranchDelete?branchId=<%=b.getBranchId()%>'">Delete</button></td>
					
					<!-- 					<td><button class="btn btn-sm btn-primary" data-toggle="modal" -->
					<!-- 							data-target="#editAuthorModal">Edit</button></td> -->
					<!-- 					<td><button class="btn btn-sm btn-danger">Delete</button></td> -->
				</tr>
				<%
					}
				%>
			</table>

			<nav aria-label="Page navigation">
				<ul class="pagination">
					<%
						if (searchString == "Search branch!") {
							if (pageNo != 1) {
					%>
					<li><a
						href="administrationBranchDelete?pageNo=<%=(pageNo - 1)%>&pageSize=<%=pageSize%> "
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<%
						}
							for (int i = 1; i <= totalPages; i++) {
					%>
					<li><a
						href="administrationBranchDelete?pageNo=<%=i%>&pageSize=<%=pageSize%>"><%=i%></a></li>
					<%
						}
							if (pageNo != totalPages) {
					%>
					<li><a
						href="administrationBranchDelete?pageNo=<%=(pageNo + 1)%>&pageSize=<%=pageSize%>"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
					<%
						}
						} else {
							if (pageNo != 1) {
					%>
					<li><a
						href="searchBranchDelete?searchString=<%=searchString%>&pageNo=<%=(pageNo - 1)%>&pageSize=<%=pageSize%>"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<%
						}
							for (int i = 1; i <= totalPages; i++) {
					%>
					<li><a
						href="searchBranchDelete?searchString=<%=searchString%>&pageNo=<%=i%>&pageSize=<%=pageSize%>"><%=i%></a></li>
					<%
						}
							if (pageNo != totalPages) {
					%>
					<li><a
						href="searchBranchDelete?searchString=<%=searchString%>&pageNo=<%=(pageNo + 1)%>&pageSize=<%=pageSize%>"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
					<%
						}
						}
					%>

				</ul>
			</nav>
		</div>
		<!-- 	End BooK Table on the right -->
	</div>
</div>

<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" id="bookOps">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content"></div>
	</div>
</div>
