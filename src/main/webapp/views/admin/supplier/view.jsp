<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Dashboard</title>

<%@ include file="/common/admin/head.jsp" %>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		
<%@ include file="/common/admin/header.jsp" %>
			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">

							<!-- /.card -->

							<div class="card">
								<div class="card-header">
									<h3 class="card-title">DataTable with default features</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<div id="example1_wrapper"
										class="dataTables_wrapper dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12">
												<table id="example1"
													class="table table-bordered table-striped dataTable dtr-inline"
													aria-describedby="example1_info">
													<thead>
														<tr>
															<th class="sorting sorting_asc" tabindex="0"
																aria-controls="example1" rowspan="1" colspan="1"
																aria-sort="ascending"
																aria-label="Rendering engine: activate to sort column descending">SupplierID
															</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1"
																aria-label="Browser: activate to sort column ascending">CompanyName</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1"
																aria-label="Platform(s): activate to sort column ascending">Email</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1"
																aria-label="Platform(s): activate to sort column ascending">Fax</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1"
																aria-label="Platform(s): activate to sort column ascending">Number</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1"
																aria-label="Platform(s): activate to sort column ascending">Country</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1"
																aria-label="Platform(s): activate to sort column ascending">State</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1"
																aria-label="CSS grade: activate to sort column ascending">Action
															</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${suppliers}" var="item" varStatus="loop">
															<c:set var="rowClass"
																value="${loop.index % 2 == 0 ? 'even' : 'odd'}" />
															<tr class="${rowClass}">
																<td class="dtr-control sorting_1" tabindex="0">${item.supplierID}</td>
																<td class="dtr-control sorting_1" tabindex="0">${item.companyName}</td>
																<td class="dtr-control sorting_1" tabindex="0">${item.contactEmail}</td>
																<td class="dtr-control sorting_1" tabindex="0">${item.contactFax}</td>
																<td class="dtr-control sorting_1" tabindex="0">${item.contactNumber}</td>
																<td class="dtr-control sorting_1" tabindex="0">${item.country}</td>
																<td class="dtr-control sorting_1" tabindex="0">${item.state}</td>
<td>
																	<div>
																		<button type="button"
																			class="btn btn-block btn-outline-warning btn-sm"
																			onclick="editBtn('${item.supplierID}')">Sửa</button>
																		<button type="button"
																			class="btn btn-block btn-outline-danger btn-sm"
																			onclick="deleteBtn('${item.supplierID}')">Xóa</button>
																	</div>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

		</div>
		<!-- /.content-wrapper -->
		<%@ include file="/common/admin/footer.jsp" %>
	<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
  });
  function deleteBtn(id)
  {
      const deleteURL = "http://localhost:8080/DemoSTS/adsupplier?action=delete&id="+id;

      fetch(deleteURL, {
          method: "GET",
      })
      .then(response => {
          if (response.ok) {
             // alert("Xóa thành công");
              window.location.href="http://localhost:8080/DemoSTS/adsupplier";
          } else {
              alert("Xóa không thành công");
          }
      })
      .catch(error => {
          console.error("Lỗi khi gửi yêu cầu xóa: ", error);
      });
  }
  function editBtn(id)
  {
      const editURL = "http://localhost:8080/DemoSTS/adsupplier?action=edit&id="+id;
      console.log(editURL);
      window.location.href = editURL;
  }
	</script>

</body>
</html>
