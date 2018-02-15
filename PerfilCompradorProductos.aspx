<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PerfilCompradorProductos.aspx.cs"
    Inherits="Connecting.Web.PerfilCompradorProductos" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Src="UserControl/wucFruta.ascx" TagName="WucMatchFruta" TagPrefix="uc1" %>
<%@ Register Src="UserControl/WucArtesania.ascx" TagName="WucArtesania" TagPrefix="uc2" %>
<%@ Register Src="UserControl/wucManufactura.ascx" TagName="wucManufactura" TagPrefix="uc3" %>
<%@ Register Src="UserControl/WucMueble.ascx" TagName="WucMueble" TagPrefix="uc5" %>
<%@ Register Src="UserControl/WucOrnamental.ascx" TagName="WucOrnamental" TagPrefix="uc6" %>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">


        function irMisNegocios() {
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

    <div class="contenido">
        <div style="float: left; width: 150px; height: 100%">
            <dx:ASPxTabControl ID="tabPerfiles" runat="server" ActiveTabIndex="0" EnableTheming="True" Theme="Material" TabPosition="Left" Height="100%">
                <Tabs>
                    <dx:Tab Name="tabGenerales" Text="Generales" NavigateUrl="~/PerfilCompradorGenerales.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabContactos" Text="Contactos" NavigateUrl="~/PerfilCompradorContactos.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabImportacion" Text="Importación" NavigateUrl="~/PerfilCompradorImportacion.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabDistribucion" Text="Distribución" NavigateUrl="~/PerfilCompradorDistribucion.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabMercado" Text="Certificaciones" NavigateUrl="~/PerfilCompradorCertificacion.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabCertificacion" Text="Forma de Pago" NavigateUrl="~/PerfilCompradorFormaPago.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabComprador" Text="Ferias" NavigateUrl="~/PerfilCompradorFerias.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabProductos" Text="Productos" NavigateUrl="~/PerfilCompradorProductos.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                </Tabs>
            </dx:ASPxTabControl>
        </div>

        <div style="float: left; width: 85%;">
            <div class="per-prod-Titulo">
                <dx:ASPxLabel ID="lbltitulo" runat="server" Text="Formulario de {Perfil de Producto}" CssClass="per-prod-titulo" Width="100%" ClientInstanceName="lblTitulo"></dx:ASPxLabel>
                <br />
                <dx:ASPxLabel ID="lblSutitulo" runat="server" Text="{Nombre Empresa} - Ingreso de productos." CssClass="per-prod-subTitulo" Width="100%"></dx:ASPxLabel>
            </div>

            <div class="per-prod-barra">
                <div class="per-prod-barraLista">
                    <dx:ASPxComboBox ID="cmbPerfilProducto" runat="server" ValueType="System.Int32" Theme="Moderno" TextField="NombrePerfilProducto"
                        ValueField="IdPerfilProducto" Width="300px" NullText="Seleccionar Formulario" BackColor="#FFFFDD" Height="45px" ClientInstanceName="cmbPerfilProducto">
                        <ClientSideEvents ValueChanged="mostrarFormulario"></ClientSideEvents>
                        <ItemStyle>
                            <SelectedStyle BackColor="#FFFFDD" Font-Bold="True">
                            </SelectedStyle>
                        </ItemStyle>
                    </dx:ASPxComboBox>
                </div>

                <div class="per-prod-barraBoton">
                    <dx:ASPxButton ID="btnMatch" runat="server" AutoPostBack="False" Text="Mis Negocios" Theme="MetropolisBlue" ImagePosition="Right">
                        <Image Url="Content/Images/Nota.png"></Image>
                        <Paddings Padding="10px" />
                        <ClientSideEvents Click="irMisNegocios"></ClientSideEvents>
                    </dx:ASPxButton>
                </div>

                <div class="per-prod-barraBoton">
                    <dx:ASPxButton ID="btnTodos" runat="server" AutoPostBack="False" Text="Ver Todos" Theme="MetropolisBlue"
                        ImagePosition="Right" GroupName="view" Checked="True">
                        <Image Url="Content/Images/Todos productos.png"></Image>
                        <Paddings Padding="10px" />
                        <ClientSideEvents Click="mostrarTodos"></ClientSideEvents>
                    </dx:ASPxButton>
                </div>

                <div class="per-prod-barraBoton">
                    <dx:ASPxButton ID="btnMisProductos" runat="server" AutoPostBack="False" Text="Mis Productos" Theme="MetropolisBlue" GroupName="view" ImagePosition="Right">
                        <Image Url="Content/Images/Mis productos.png"></Image>
                        <Paddings Padding="10px" />
                        <ClientSideEvents Click="mostrarMisProductos"></ClientSideEvents>
                    </dx:ASPxButton>
                </div>

            </div>

            <div class="per-prod-datos">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="callbackPanel" OnCallback="ASPxCallbackPanel1_Callback">
                    <ClientSideEvents EndCallback="OnEndCallback"></ClientSideEvents>
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxPanel ID="pnlAgricola" runat="server" Width="100%" ClientInstanceName="pnlAgricola" ClientVisible="False">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <uc1:WucMatchFruta ID="WucFruta1" runat="server" />
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxPanel>

                            <dx:ASPxPanel ID="pnlArtesania" runat="server" Width="100%" ClientInstanceName="pnlArtesania" ClientVisible="False">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <uc2:WucArtesania ID="WucArtesania1" runat="server" />
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxPanel>

                            <dx:ASPxPanel ID="pnlManufactura" runat="server" Width="100%" ClientInstanceName="pnlManufactura" ClientVisible="False">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <uc3:wucManufactura ID="wucManufactura1" runat="server" />
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxPanel>

                            <dx:ASPxPanel ID="pnlCafe" runat="server" Width="100%" ClientInstanceName="pnlCafe" ClientVisible="False">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxPanel>

                            <dx:ASPxPanel ID="pnlMueble" runat="server" Width="100%" ClientInstanceName="pnlMueble" ClientVisible="False">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <uc5:WucMueble ID="WucMueble" runat="server" />
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxPanel>

                            <dx:ASPxPanel ID="pnlOrnamental" runat="server" Width="100%" ClientInstanceName="pnlOrnamental" ClientVisible="False">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <uc6:WucOrnamental ID="WucOrnamental" runat="server" />
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
                Modal="True" Theme="Moderno" Width="500px" ClientInstanceName="popMensajes" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <div style="clear: both">
                            <dx:ASPxMemo ID="txtMensaje" runat="server" Height="150px" Theme="Moderno" Width="100%" ClientInstanceName="txtMensaje">
                                <Border BorderStyle="None" />
                            </dx:ASPxMemo>
                        </div>
                        <div style="width: 120px; margin: 0 auto;">
                            <dx:ASPxButton ID="btnAceptarMsg" runat="server" Text="Aceptar" Theme="Moderno" AutoPostBack="False">
                                <ClientSideEvents Click="OnAceptarMensaje"></ClientSideEvents>
                            </dx:ASPxButton>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
    </div>

</asp:Content>
