<?php
ob_start();
session_start();
include('inc/header.php');
include 'Inventory.php';
$inventory = new Inventory();
$inventory->checkLogin();
?>

<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<script src="js/supplier.js"></script>
<script src="js/common.js"></script>
<?php include('inc/container.php'); ?>
<div class="container">

	<?php include("menus.php"); ?>
	<div class="row">
		<div class="col-lg-12">
			<div class="card card-default rounded-0 shadow">
				<div class="card-header">
					<div class="row">
						<div class="col-lg-10 col-md-10 col-sm-8 col-xs-6">
							<h3 class="card-title">Listado de Proveedores</h3>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 text-end">
							<button type="button" name="add" id="addSupplier" data-bs-toggle="modal" data-bs-target="#userModal" class="btn btn-primary btn-sm rounded-0"><i class="far fa-plus-square"></i> Agregar Proveedores</button>
						</div>
					</div>
					<div class="clear:both"></div>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-sm-12 table-responsive">
							<table id="supplierList" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>ID</th>
										<th>Nombre</th>
										<th>Móvil</th>
										<th>Dirección</th>
										<th>Estado</th>
										<th>Acción</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="supplierModal" class="modal fade">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title"><i class="fa fa-plus"></i> Agregar Proveedor</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<form method="post" id="supplierForm">
							<input type="hidden" name="supplier_id" id="supplier_id" />
							<input type="hidden" name="btn_action" id="btn_action" />
							<div class="mb-3">
							<label>Nombre de Proveedor</label>
                            <input type="text" name="supplier_name" id="supplier_name" class="form-control rounded-0" pattern="[A-Za-z]+" required />


							<div class="mb-3">
							<label class="control-label"># Móvil</label>
								<input type="number" name="mobile" id="mobile" class="form-control rounded-0" pattern="[0-9]{10}" required onfocus="this.placeholder = ''" onblur="if(this.value=='') this.placeholder='Ejemplo: 3245678905'" placeholder="Ejemplo: 3245678905" />
							</div>
							<div class="mb-3">
								<label>Dirección</label>
								<textarea name="address" id="address" class="form-control rounded-0" rows="5" required></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<input type="submit" name="action" id="action" class="btn btn-primary rounded-0 btn-sm" value="addSupplier" form="supplierForm" />
						<button type="button" class="btn btn-default border rounded-0 btn-sm" data-bs-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include('inc/footer.php'); ?>