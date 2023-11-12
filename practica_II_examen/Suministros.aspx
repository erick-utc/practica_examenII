<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Suministros.aspx.cs" Inherits="practica_examen_II.Suministros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Practica II Examen</title>
    <link href="css/main.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>
<body class="bg-primary">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                 <div class="col--12 text-white text-center">
                     <h2>Suministros</h2>
                 </div>
                <div class="col--12 p-4">
                    <asp:GridView runat="server" ID="dgSuministros" PageSize="10" HorizontalAlign="Center"
                        CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
                        RowStyle-CssClass="rows" AllowPaging="True"    />
                </div>
                <div class="col-4 text-center">
                    <label for="piezas" class="form-label text-white">Pieza</label>
                    <asp:DropDownList runat="server" ID="piezas" CssClass="form-select" />
                </div>
                <div class="col-4 text-center text-white">
                    <label for="proveedores" class="form-label">Profeedores</label>
                    <asp:DropDownList runat="server" ID="proveedores" CssClass="form-select" />
                </div>
                <div class="col-4 text-center text-white">
                    <label for="precio" class="form-label">Precio</label>
                    <div class="input-group mb-3">
                      <span class="input-group-text">₡</span>
                      <asp:TextBox runat="server" ID="precio" CssClass="form-control" Text="" />
                      <span class="input-group-text">.00</span>
                    </div>
                    
                </div>
                <div class="col--5"></div>
                <div class="col--2 text-center mt-4">
                    <asp:Button runat="server" ID="btnAgregar" Text="Agregar Suministro" class="btn btn-success" OnClick="btnAgregar_Click" />
                </div>
                <div class="col--5"></div>
            </div>

        </div>
        
    </form>
</body>
</html>
