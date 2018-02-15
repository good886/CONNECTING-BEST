<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MatchCompradores.aspx.cs" Inherits="Connecting.Web.MatchCompradores" meta:resourcekey="PageResource6" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Src="UserControl/WucMatchFruta.ascx" TagName="WucMatchFruta" TagPrefix="uc1" %>
<%@ Register Src="UserControl/WucMatchArtesania.ascx" TagName="WucMatchArtesania" TagPrefix="uc2" %>
<%@ Register Src="UserControl/wucManufactura.ascx" TagName="wucManufactura" TagPrefix="uc3" %>
<%@ Register src="UserControl/WucMatchManufactura.ascx" tagname="WucMatchManufactura" tagprefix="uc4" %>
<%@ Register src="UserControl/WucMatchMueble.ascx" tagname="WucMatchMueble" tagprefix="uc5" %>
<%@ Register src="UserControl/WucMatchOrnamental.ascx" tagname="WucMatchOrnamental" tagprefix="uc6" %>


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
            window.location.replace("PerfilCompradorGenerales.aspx");
        }
    </script>

    <div class="form-envolver-pagina">
        <dx:ASPxCallbackPanel ID="callbackPanel" runat="server" Width="100%" ClientInstanceName="callbackPanel" OnCallback="callbackPanel_Callback">
            <ClientSideEvents EndCallback="OnEndCallbackPanel"></ClientSideEvents>
            <PanelCollection>
                <dx:PanelContent runat="server">

                    <div class="seccionTitulo">
                        <div>
                            <dx:ASPxLabel ID="lblTitulo" runat="server" Text="Coincidencia de productos por empresa" CssClass="titulo">
                            </dx:ASPxLabel>
                        </div>
                        <div style="float: left">
                            <dx:ASPxButton ID="btnIrPerfil" runat="server" Text="Nombre Perfil" RenderMode="Link"
                                Theme="Moderno" Font-Underline="False" AutoPostBack="False" ForeColor="Black">
                                <ClientSideEvents Click="IrPerfil"></ClientSideEvents>
                                <Image Url="~/IMG/Regresar.png"></Image>
                                <Paddings PaddingRight="15px" PaddingLeft="15px" />
                                <HoverStyle Font-Bold="True" ForeColor="Black">
                                </HoverStyle>
                            </dx:ASPxButton>
                        </div>
                        <div style="float: right">
                            <dx:ASPxComboBox ID="cmbFormularios" runat="server" AutoPostBack="False" ClientInstanceName="cmbFormularios" TextField="NombrePerfilProducto" Theme="Moderno"
                                ValueField="IdPerfilProducto" ValueType="System.Int32" Caption="Tipo de Producto" NullText="Seleccione el tipo de producto a consultar" Width="320px">
                                <ClientSideEvents ValueChanged="OnFormularioChanged"></ClientSideEvents>
                                <CaptionStyle Font-Bold="True"></CaptionStyle>
                            </dx:ASPxComboBox>
                        </div>
                    </div>
                    <br />
                    <dx:ASPxPanel ID="pnlAgricultura" runat="server" Width="100%" ClientInstanceName="pnlAgricultura" ClientVisible="False">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <uc1:WucMatchFruta ID="WucMatchFruta1" runat="server" />
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>

                    <dx:ASPxPanel ID="pnlArtesania" runat="server" Width="100%" ClientInstanceName="pnlAgricultura" ClientVisible="False">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <uc2:WucMatchArtesania ID="WucMatchArtesania1" runat="server" />
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>


                    <dx:ASPxPanel ID="pnlManufactura" runat="server" Width="100%" ClientInstanceName="pnlAgricultura" ClientVisible="False">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <uc4:WucMatchManufactura ID="WucMatchManufactura1" runat="server" />
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>

                    <dx:ASPxPanel ID="pnlCafe" runat="server" Width="100%" ClientInstanceName="pnlAgricultura" ClientVisible="False">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>


                    <dx:ASPxPanel ID="pnlMueble" runat="server" Width="100%" ClientInstanceName="pnlAgricultura" ClientVisible="False">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <uc5:WucMatchMueble ID="WucMatchMueble1" runat="server" />
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>

                    <dx:ASPxPanel ID="pnlOrnamental" runat="server" Width="100%" ClientInstanceName="pnlAgricultura" ClientVisible="False">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <uc6:WucMatchOrnamental ID="WucMatchOrnamental1" runat="server" />
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>
    <dx:ASPxPopupControl ID="popMensajes" runat="server" CloseAction="CloseButton" HeaderText="Notificación de Mensajes"
        Modal="True" Theme="Moderno" Width="500px" ClientSideEvents="popMensajes" ClientInstanceName="popMensajes" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <div style="clear: both">
                    <dx:ASPxMemo ID="txtMensaje" runat="server" Height="150px" Theme="Moderno" Width="100%" ClientInstanceName="txtMensaje">
                        <Border BorderStyle="None" />
                    </dx:ASPxMemo>
                </div>
                <div style="width: 120px; margin: 0 auto;">
                    <dx:ASPxButton ID="btnAceptarMsg" runat="server" Text="Aceptar" Theme="Moderno" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {popMensajes.Hide();}"></ClientSideEvents>
                    </dx:ASPxButton>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
