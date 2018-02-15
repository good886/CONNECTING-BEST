<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MatchSocios.aspx.cs" Inherits="Connecting.Web.MatchSocios" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .titulo {
            font-size: 24px;
            font-weight: bold;
            font-family: sans-serif;
            /*background: red;*/
        }

        .seccionTitulo {
            width: 100%;
            clear: both;
            background: lightyellow;
            overflow: auto;
            text-align: center;
            padding-top: 10px;
            padding-bottom: 10px;
            padding-right: 10px;
        }


        .seccionDatos {
            width: 100%;
            clear: both;
            overflow: auto;
        }
    </style>

    <script type="text/javascript">

        function OnFormularioChanged(s, e) {
            callbackPanel.PerformCallback(s.GetValue());
        }

        function OnEndCallbackPanel(s, e) {

        }

        function OnAceptarMensaje(s, e) {
            popMensajes.Hide();
        }

        function OnEndCallbackGrid(s, e) {

            if (grid.cpError) {
                txtMensaje.SetText(grid.cpError);
                popMensajes.Show();

            } else {
                popMensajes.Hide();
            }
        }

        function IrPerfil(s, e) {
            window.location.replace("PerfilSocioGenerales.aspx");
        }
    </script>

    <div class="form-envolver-pagina">
        <div class="seccionTitulo">
            <div>
                <dx:ASPxLabel ID="lblTitulo" runat="server" Text="Coincidencia de productos por empresa" CssClass="titulo">
                </dx:ASPxLabel>
            </div>
            <div style="float: left">
                <dx:ASPxButton ID="btnIrPerfil" runat="server" Text="Nombre Perfil" RenderMode="Link"
                    Font-Underline="False" AutoPostBack="False" ForeColor="Black">
                    <ClientSideEvents Click="IrPerfil"></ClientSideEvents>
                    <Image Url="~/IMG/Regresar.png"></Image>
                    <Paddings PaddingRight="15px" PaddingLeft="15px" />
                    <HoverStyle Font-Bold="True" ForeColor="Black">
                    </HoverStyle>
                </dx:ASPxButton>
            </div>
            <div style="float: right">
                <dx:ASPxComboBox ID="cmbFormularios" runat="server" AutoPostBack="False" ClientInstanceName="cmbFormularios" TextField="NombrePerfilProducto" 
                    ValueField="IdPerfilProducto" ValueType="System.Int32" Caption="Tipo de Producto" NullText="Seleccione el tipo de producto a consultar" Width="320px" ClientEnabled="False">
                    <ClientSideEvents ValueChanged="OnFormularioChanged"></ClientSideEvents>
                    <CaptionStyle Font-Bold="True"></CaptionStyle>
                </dx:ASPxComboBox>
            </div>
        </div>

        <br />
        <dx:ASPxPanel ID="pnlFormularios" runat="server" Width="100%" ClientInstanceName="pnlFormularios">
            <PanelCollection>
                <dx:PanelContent runat="server">
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>

        <div>
        </div>

    </div>
</asp:Content>
