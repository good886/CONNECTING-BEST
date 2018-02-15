<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FormProductoFormulario.aspx.cs" Inherits="Connecting.Web.FormProductoFormulario"  meta:resourcekey="PageResource1"  %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Src="UserControl/wucFruta.ascx" TagName="WucMatchFruta" TagPrefix="uc1" %>
<%@ Register Src="UserControl/WucArtesania.ascx" TagName="WucArtesania" TagPrefix="uc2" %>
<%@ Register Src="UserControl/wucManufactura.ascx" TagName="wucManufactura" TagPrefix="uc3" %>
<%@ Register Src="UserControl/WucMueble.ascx" TagName="WucMueble" TagPrefix="uc5" %>
<%@ Register Src="UserControl/WucOrnamental.ascx" TagName="WucOrnamental" TagPrefix="uc6" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
        <script type="text/javascript">

        function irMiPerfil() {
            if (hflParams.Get("tipo") == "Socio")
                window.location.replace("PerfilSocioGenerales.aspx");
            else
                window.location.replace("PerfilCompradorGenerales.aspx");
        }

        function irMisNegocios() {
            if (hflParams.Get("tipo") == "Socio")
                window.location.replace("MatchSocios.aspx?Id=" + hflParams.Get("id"));
            else
                window.location.replace("MatchCompradores.aspx?Id=" + hflParams.Get("id"));
        }

        function OnAceptarMensaje(s, e) {
            popMensajes.Hide();
        }

        function OnEndCallback(s, e) {

            if (pnlAgricola.cpError) {
                txtMensaje.SetText(pnlAgricola.cpError);
                popMensajes.Show();

            } else {
                popMensajes.Hide();
            }
        }

        function visualizarFormulario(s, e) {
            pnlManufactura.SetVisible(false);
            pnlAgricola.SetVisible(false);
            pnlOrnamental.SetVisible(false);
            pnlMueble.SetVisible(false);
            pnlCafe.SetVisible(false);
            pnlArtesania.SetVisible(false);

            if (s.GetValue() == "1") {
                pnlManufactura.SetVisible(true);
            } else if (s.GetValue() == "2") {
                pnlAgricola.SetVisible(true);
            } else if (s.GetValue() == "3") {
                pnlOrnamental.SetVisible(true);
            } else if (s.GetValue() == "4") {
                pnlMueble.SetVisible(true);
            } else if (s.GetValue() == "5") {
                pnlCafe.SetVisible(true);
            } else if (s.GetValue() == "6") {
                pnlArtesania.SetVisible(true);
            }
            lblTitulo.SetText("Formulario de " + s.GetText());
        }

        function mostrarTodos(s, e) {
            callbackPanel.PerformCallback("Todos");
        }

        function mostrarMisProductos(s, e) {
            callbackPanel.PerformCallback("MisProductos");
        }

        function mostrarFormulario(s, e) {
            if (hflParams.Get("idioma") == "1")
                lblTitulo.SetText("Formulario de " + s.GetText());
            else
                lblTitulo.SetText("Form of " + s.GetText());

            callbackPanel.PerformCallback("mostrarFormulario");
        }

    </script>

    <div class="per-prod-Titulo">        
        <dx:ASPxLabel ID="lbltitulo" runat="server" Text="Formulario de {Perfil de Producto}" CssClass="per-prod-titulo" Width="100%" ClientInstanceName="lblTitulo" meta:resourcekey="lbltituloResource1"></dx:ASPxLabel>
        <br />
        <dx:ASPxLabel ID="lblSutitulo" runat="server" Text="{Nombre Empresa} - Ingreso de productos." CssClass="per-prod-subTitulo" Width="100%" meta:resourcekey="lblSutituloResource1"></dx:ASPxLabel>
    </div>

    <div class="per-prod-barra">
        <div class="per-prod-barraLista">
            <dx:ASPxComboBox ID="cmbPerfilProducto" runat="server" ValueType="System.Int32" Theme="Moderno" TextField="NombrePerfilProducto"
                ValueField="IdPerfilProducto" Width="300px" NullText="Seleccionar Formulario" BackColor="#FFFFDD" Height="45px" ClientInstanceName="cmbPerfilProducto" meta:resourcekey="cmbPerfilProductoResource1">
                <ClientSideEvents ValueChanged="mostrarFormulario"></ClientSideEvents>
                <ItemStyle>
                    <SelectedStyle BackColor="#FFFFDD" Font-Bold="True">
                    </SelectedStyle>
                </ItemStyle>
            </dx:ASPxComboBox>
        </div>

        <div class="per-prod-barraBoton">
            <dx:ASPxButton ID="btnPerfil" runat="server" AutoPostBack="False" ImagePosition="Right" Text="Mi Perfil" Theme="MetropolisBlue" meta:resourcekey="btnPerfilResource1">
                <Image Url="Content/Images/User LogIn.png"></Image>
                <Paddings Padding="10px" />
                <ClientSideEvents Click="irMiPerfil"></ClientSideEvents>
            </dx:ASPxButton>
        </div>

        <div class="per-prod-barraBoton">
            <dx:ASPxButton ID="btnMatch" runat="server" AutoPostBack="False" Text="Mis Negocios" Theme="MetropolisBlue" ImagePosition="Right" meta:resourcekey="btnMatchResource1">
                <Image Url="Content/Images/Nota.png"></Image>
                <Paddings Padding="10px" />
                <ClientSideEvents Click="irMisNegocios"></ClientSideEvents>
            </dx:ASPxButton>
        </div>

        <div class="per-prod-barraBoton">
            <dx:ASPxButton ID="btnTodos" runat="server" AutoPostBack="False" Text="Ver Todos" Theme="MetropolisBlue"
                ImagePosition="Right" GroupName="view" Checked="True" CausesValidation="False" meta:resourcekey="btnTodosResource1">
                <Image Url="Content/Images/Todos productos.png"></Image>
                <Paddings Padding="10px" />
                <ClientSideEvents Click="mostrarTodos"></ClientSideEvents>
            </dx:ASPxButton>
        </div>

        <div class="per-prod-barraBoton">
            <dx:ASPxButton ID="btnMisProductos" runat="server" AutoPostBack="False" Text="Mis Productos" Theme="MetropolisBlue" GroupName="view" ImagePosition="Right" CausesValidation="False" meta:resourcekey="btnMisProductosResource1">
                <Image Url="Content/Images/Mis productos.png"></Image>
                <Paddings Padding="10px" />
                <ClientSideEvents Click="mostrarMisProductos"></ClientSideEvents>
            </dx:ASPxButton>
        </div>

    </div>

    <div class="per-prod-datos">
        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="callbackPanel" OnCallback="ASPxCallbackPanel1_Callback" meta:resourcekey="ASPxCallbackPanel1Resource1">
            <ClientSideEvents EndCallback="OnEndCallback"></ClientSideEvents>
            <PanelCollection>
                <dx:PanelContent runat="server" meta:resourcekey="PanelContentResource1">
                    <dx:ASPxPanel ID="pnlAgricola" runat="server" Width="100%" ClientInstanceName="pnlAgricola" ClientVisible="False" meta:resourcekey="pnlAgricolaResource1">
                        <PanelCollection>
                            <dx:PanelContent runat="server" meta:resourcekey="PanelContentResource2">
                                <uc1:WucMatchFruta ID="WucFruta1" runat="server" />
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>

                    <dx:ASPxPanel ID="pnlArtesania" runat="server" Width="100%" ClientInstanceName="pnlArtesania" ClientVisible="False" meta:resourcekey="pnlArtesaniaResource1">
                        <PanelCollection>
                            <dx:PanelContent runat="server" meta:resourcekey="PanelContentResource3">
                                <uc2:WucArtesania ID="WucArtesania1" runat="server" />
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>

                    <dx:ASPxPanel ID="pnlManufactura" runat="server" Width="100%" ClientInstanceName="pnlManufactura" ClientVisible="False" meta:resourcekey="pnlManufacturaResource1">
                        <PanelCollection>
                            <dx:PanelContent runat="server" meta:resourcekey="PanelContentResource4">
                                <uc3:wucManufactura ID="wucManufactura1" runat="server" />
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>

                    <dx:ASPxPanel ID="pnlCafe" runat="server" Width="100%" ClientInstanceName="pnlCafe" ClientVisible="False" meta:resourcekey="pnlCafeResource1">
                        <PanelCollection>
                            <dx:PanelContent runat="server" meta:resourcekey="PanelContentResource5">
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>

                    <dx:ASPxPanel ID="pnlMueble" runat="server" Width="100%" ClientInstanceName="pnlMueble" ClientVisible="False" meta:resourcekey="pnlMuebleResource1">
                        <PanelCollection>
                            <dx:PanelContent runat="server" meta:resourcekey="PanelContentResource6">
                                <uc5:WucMueble ID="WucMueble" runat="server" />
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>

                    <dx:ASPxPanel ID="pnlOrnamental" runat="server" Width="100%" ClientInstanceName="pnlOrnamental" ClientVisible="False" meta:resourcekey="pnlOrnamentalResource1">
                        <PanelCollection>
                            <dx:PanelContent runat="server" meta:resourcekey="PanelContentResource7">
                                <uc6:WucOrnamental ID="WucOrnamental" runat="server" />
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>

                    <dx:ASPxPanel ID="pnlDefault" runat="server" Width="100%" ClientInstanceName="pnlDefault" ClientVisible="False" Height="500px" BackColor="White" meta:resourcekey="pnlDefaultResource1" >
                        <PanelCollection>
                            <dx:PanelContent runat="server" meta:resourcekey="PanelContentResource8">
                                <br />
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" Font-Size="10pt" Font-Strikeout="False" ForeColor="#CC3300" Text="!No se encontro un formulario de producto asociado a este perfil!" meta:resourcekey="ASPxLabel1Resource1">                                    
                                </dx:ASPxLabel>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <dx:ASPxHiddenField ID="hflParams" runat="server" ClientInstanceName="hflParams">
    </dx:ASPxHiddenField>

    <dx:ASPxPopupControl ID="popMensajes" runat="server" CloseAction="CloseButton" HeaderText="Notificación de Mensajes"
        Modal="True" Width="500px" ClientInstanceName="popMensajes" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" meta:resourcekey="popMensajesResource1">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" meta:resourcekey="PopupControlContentControlResource1">
                <div style="clear: both">
                    <dx:ASPxMemo ID="txtMensaje" runat="server" Height="150px" Width="100%" ClientInstanceName="txtMensaje" meta:resourcekey="txtMensajeResource1">
                        <Border BorderStyle="None" />
                    </dx:ASPxMemo>
                </div>
                <div style="width: 120px; margin: 0 auto;">
                    <dx:ASPxButton ID="btnAceptarMsg" runat="server" Text="Aceptar" AutoPostBack="False" meta:resourcekey="btnAceptarMsgResource1">
                        <ClientSideEvents Click="OnAceptarMensaje"></ClientSideEvents>
                    </dx:ASPxButton>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


</asp:Content>
