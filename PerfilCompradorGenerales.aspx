<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PerfilCompradorGenerales.aspx.cs" Inherits="Connecting.Web.PerfilCompradorGenerales" meta:resourcekey="PageResource1" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .formLayoutContainer {
            width: 100%;
            /*margin: auto;*/
            padding: 0px;
            background: white;
        }

        .layoutGroupBoxCaption {
            font-size: 16px;
            font-weight: bold;
        }

        .header {
            font-size: 16px;
            font-weight: bold;
            color: black;
            /*font-family: sans-serif;*/
        }

        .headerStep {
            font-size: 14px;
            font-weight: bold;
            color: navy;
            /*font-family: sans-serif;*/
        }

        .customHeader {
            height: 48px;
        }

        .Estado {
            padding: 5px;
        }
    </style>

    <script type="text/javascript">

        /* Aprobacion */
        function MostrarPopAprobacion() {
            if (lblEstadoSocio.GetText() == "Aprobado") {
                txtMensaje.SetText('El expediente ya ha sido aprobado');
                popMensajes.Show();
            } else {
                popAprobacion.Show();
            }
        }

        function CerrarAprobacion() {
            popAprobacion.Hide();
        }

        function Aprobar(s, e) {
            callback.PerformCallback("aprobar");            
        }

        /* Mensajes al finalizae el callback*/
        function EndCallback(s, e) {
            if (e.result.toString().startsWith("Aprobado")) {
                lblEstadoSocio.SetText("Aprobado");
                lblEstadoSocio.GetMainElement().style.background = 'Green';
                lblEstadoSocio.GetMainElement().style.color = 'White';
                popAprobacion.Hide();
            }
            if (e.result.toString() == "Enviado") {
                popEnviarUsuario.Hide();

            } else {
                txtMensaje.SetText(e.result.toString());
                popMensajes.Show();
            }
        }


        /*  Creacion de nota */
        function CrearNota() {
            callback.PerformCallback("nota");
        }

        /*  Enivar Usuario */
        function OnMostrarEnviarUsuario() {
            txtCorreoEnviarUsuario.SetText("");
            cmbIddiomaEnvUsuario.SetValue(null);
            popEnviarUsuario.Show();
            txtCorreoEnviarUsuario.Focus();
        }

        function OnEnviarUsuario(s, e) {
            callback.PerformCallback("EnviarUsuario#" + txtCorreoEnviarUsuario.GetValue() + '#' +  cmbIddiomaEnvUsuario.GetValue() );
        }
    </script>

    <div class="contenido">
        <div style="float: left; width: 150px; height: 100%">
            <dx:ASPxTabControl ID="tabPerfiles" runat="server" ActiveTabIndex="0" EnableTheming="True" Theme="Material" TabPosition="Left" Height="100%" meta:resourcekey="tabPerfilesResource1">
                <Tabs>
                    <dx:Tab Name="tabGenerales" Text="Generales" NavigateUrl="~/PerfilCompradorGenerales.aspx" meta:resourcekey="TabResource1">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabContactos" Text="Contactos" NavigateUrl="~/PerfilCompradorContactos.aspx" meta:resourcekey="TabResource2">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabImportacion" Text="Importación" NavigateUrl="~/PerfilCompradorImportacion.aspx" meta:resourcekey="TabResource3">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabDistribucion" Text="Distribución" NavigateUrl="~/PerfilCompradorDistribucion.aspx" meta:resourcekey="TabResource4">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabMercado" Text="Certificaciones" NavigateUrl="~/PerfilCompradorCertificacion.aspx" meta:resourcekey="TabResource5">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabCertificacion" Text="Forma de Pago" NavigateUrl="~/PerfilCompradorFormaPago.aspx" meta:resourcekey="TabResource6">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabComprador" Text="Ferias" NavigateUrl="~/PerfilCompradorFerias.aspx" meta:resourcekey="TabResource7">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabProductos" Text="Productos" NavigateUrl="~/PerfilCompradorProductos.aspx" meta:resourcekey="TabResource8">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>

                </Tabs>
            </dx:ASPxTabControl>
        </div>

        <div style="float: left; width: 85%; overflow: auto">
            <dx:ASPxFormLayout ID="flyPerfilComprador" runat="server" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption"
                AlignItemCaptionsInAllGroups="True" Theme="Moderno" Width="100%" meta:resourcekey="flyPerfilCompradorResource1">
                <Items>
                    <dx:LayoutGroup Caption="" ShowCaption="False" GroupBoxDecoration="None" UseDefaultPaddings="False" ColCount="3" meta:resourcekey="LayoutGroupResource1">
                        <Items>
                            <dx:LayoutItem Caption="Avance" ShowCaption="False" HorizontalAlign="Left" meta:resourcekey="LayoutItemResource1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource1">
                                        <div style="clear: both">
                                            <dx:ASPxLabel ID="lblHeader" runat="server" Text="Perfil de Comprador" Theme="Moderno" CssClass="header" meta:resourcekey="lblHeaderResource1">
                                            </dx:ASPxLabel>
                                        </div>
                                        <div style="float: left">
                                            <dx:ASPxLabel ID="lblHeaderStep" runat="server" Text="Paso 1 de 7 - Datos Generales de la Empresa" CssClass="headerStep" meta:resourcekey="lblHeaderStepResource1">
                                            </dx:ASPxLabel>
                                        </div>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Avance" HorizontalAlign="Right" meta:resourcekey="LayoutItemResource2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource2">
                                        <dx:ASPxProgressBar ID="pbAvance" runat="server" CustomDisplayFormat="" Maximum="7" Minimum="0" Theme="Material"
                                            Width="100px" DisplayFormatString="0" meta:resourcekey="pbAvanceResource1">
                                        </dx:ASPxProgressBar>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Estado" meta:resourcekey="LayoutItemResource3">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource3">
                                        <dx:ASPxLabel ID="lblEstadoSocio" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="White" CssClass="Estado" ClientInstanceName="lblEstadoSocio" meta:resourcekey="lblEstadoSocioResource1">
                                            <Border BorderStyle="Solid" BorderWidth="1px"></Border>
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="3" ShowCaption="False" meta:resourcekey="LayoutItemResource4">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource4">
                                        <dx:ASPxMenu ID="mnuHeaderTools" runat="server" BackColor="White" EnableAdaptivity="True" ItemLinkMode="TextAndImage" SkinID="None" meta:resourcekey="mnuHeaderToolsResource1">
                                            <Items>
                                                <dx:MenuItem Name="itemRegresar" NavigateUrl="FormCompradorLista.aspx" Text="Regresar" meta:resourcekey="MenuItemResource3">
                                                    <Image Url="Content/Images/Regresar.png">
                                                    </Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem Name="itemNota" NavigateUrl="javascript:CrearNota()" Text="Crear Nota" meta:resourcekey="MenuItemResource1">
                                                    <Image Url="Content/Images/Nota.png">
                                                    </Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem Name="itemAutorizar" NavigateUrl="javascript:MostrarPopAprobacion()" Text="Autorizar Expediente" meta:resourcekey="MenuItemResource2">
                                                    <Image Url="Content/Images/Autorizar.png">
                                                    </Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem BeginGroup="True" Name="itemEnviarUsuario" Text="Enviar Usuario" NavigateUrl="javascript:OnMostrarEnviarUsuario()">
                                                    <Image Url="Content/Images/EnviarUsuario.png"></Image>
                                                    <ItemStyle>
                                                        <Border BorderStyle="Solid" BorderWidth="1px" />
                                                    </ItemStyle>
                                                </dx:MenuItem>
                                            </Items>
                                            <Border BorderStyle="None" />
                                        </dx:ASPxMenu>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="" GroupBoxDecoration="HeadingLine" SettingsItemCaptions-HorizontalAlign="Right" ShowCaption="False" meta:resourcekey="LayoutGroupResource2">
                        <Items>
                            <dx:LayoutItem Caption="Nombre de Empresa:" meta:resourcekey="LayoutItemResource5">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource5">

                                        <dx:ASPxTextBox ID="txtNombreEmpresa" runat="server" Theme="Moderno" Width="400px" meta:resourcekey="txtNombreEmpresaResource1">
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="valComprador">
                                                <RequiredField ErrorText="Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="País:" meta:resourcekey="LayoutItemResource6">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource6">

                                        <dx:ASPxComboBox ID="cmbPais" runat="server" NullText="Seleccione un registro" Theme="Moderno" ValueType="System.String" Width="360px"
                                            TextField="NombrePais" ValueField="IdPais" meta:resourcekey="cmbPaisResource1">
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="valComprador">
                                                <RequiredField ErrorText="Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Dirección:" meta:resourcekey="LayoutItemResource7">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource7">

                                        <dx:ASPxTextBox ID="txtDireccion" runat="server" Theme="Moderno" Width="400px" meta:resourcekey="txtDireccionResource1">
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="valComprador">
                                                <RequiredField ErrorText="Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Página Web:" meta:resourcekey="LayoutItemResource8">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource8">

                                        <dx:ASPxTextBox ID="txtPaginaWeb" runat="server" Theme="Moderno" Width="400px" meta:resourcekey="txtPaginaWebResource1">
                                            <ValidationSettings>
                                                <RegularExpression ErrorText="Diección Inválida" ValidationExpression="(http(s)?://)?([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Números de Teléfono:" meta:resourcekey="LayoutItemResource9">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource9">

                                        <dx:ASPxTextBox ID="txtNumeroTelefono" Theme="Moderno" runat="server" Width="250px" meta:resourcekey="txtNumeroTelefonoResource1">
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="valComprador">
                                                <RequiredField ErrorText="Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Año de Fundación:" meta:resourcekey="LayoutItemResource10">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource10">
                                        <dx:ASPxSpinEdit ID="spdAnio" runat="server" Theme="Moderno" Number="0" MaxLength="4" meta:resourcekey="spdAnioResource1">
                                            <SpinButtons ShowIncrementButtons="False">
                                            </SpinButtons>
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="valComprador">
                                                <RequiredField ErrorText="Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxSpinEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Right"></SettingsItemCaptions>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="" ShowCaption="False" GroupBoxDecoration="HeadingLine" meta:resourcekey="LayoutGroupResource3">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Left" meta:resourcekey="LayoutItemResource11">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource11">
                                        <div style="float: left; display: inline">
                                            <dx:ASPxButton ID="btnSiguiente" runat="server" Text="Siguiente" Theme="Moderno" OnClick="btnSiguiente_Click" meta:resourcekey="btnSiguienteResource1">
                                            </dx:ASPxButton>
                                        </div>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>

                </Items>
                <Styles>
                    <LayoutGroupBox>
                        <Caption CssClass="layoutGroupBoxCaption"></Caption>
                    </LayoutGroupBox>
                </Styles>
            </dx:ASPxFormLayout>

        </div>
    </div>

    <dx:ASPxCallback ID="callback" runat="server" ClientInstanceName="callback" OnCallback="callback_Callback">
        <ClientSideEvents CallbackComplete="EndCallback"></ClientSideEvents>
    </dx:ASPxCallback>

    <dx:ASPxPopupControl ID="popMensajes" runat="server" CloseAction="CloseButton" HeaderText="Notificación de Mensajes"
        Modal="True" Theme="Moderno" Width="500px" ClientSideEvents="popMensajes" ClientInstanceName="popMensajes" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" meta:resourcekey="popMensajesResource1">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" meta:resourcekey="PopupControlContentControlResource1">
                <div style="clear: both">
                    <dx:ASPxMemo ID="txtMensaje" runat="server" Height="150px" Theme="Moderno" Width="100%" ClientInstanceName="txtMensaje" meta:resourcekey="txtMensajeResource1">
                        <Border BorderStyle="None" />
                    </dx:ASPxMemo>
                </div>
                <div style="width: 120px; margin: 0 auto;">
                    <dx:ASPxButton ID="btnAceptarMsg" runat="server" Text="Aceptar" Theme="Moderno" AutoPostBack="False" meta:resourcekey="btnAceptarMsgResource1">
                        <ClientSideEvents Click="function(s, e) {popMensajes.Hide(); }"></ClientSideEvents>
                    </dx:ASPxButton>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="popAprobacion" HeaderText="Aprobación de Socio" CloseAction="CloseButton"
        runat="server" ClientInstanceName="popAprobacion" AllowDragging="True" EnableViewState="False"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="True" Theme="Moderno" meta:resourcekey="popAprobacionResource1">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" meta:resourcekey="PopupControlContentControlResource2">
                <div style="float: left; clear: both; width: 100%">
                    <dx:ASPxComboBox ID="cmbTipoServicio" runat="server" ClientInstanceName="cmbTipoServicio" Theme="Moderno"
                        Width="350px" meta:resourcekey="cmbTipoServicioResource1" Caption="Tipo de membresia"
                        HelpText="Tipo de servicio contratado" NullText="Seleccionar">
                        <Items>
                            <dx:ListEditItem Text="Gratuito" Value="G" meta:resourcekey="ListEditItemResource1" />
                            <dx:ListEditItem Text="Pagado" Value="P" meta:resourcekey="ListEditItemResource2" />
                        </Items>
                        <HelpTextSettings Position="Bottom">
                        </HelpTextSettings>
                    </dx:ASPxComboBox>
                </div>
                <div style="float: left; clear: both">
                    <dx:ASPxButton ID="btnAprobarSocio" runat="server" Text="Aprobar" AutoPostBack="False" Theme="Moderno" ClientInstanceName="btnAprobarSocio"
                        CausesValidation="False" meta:resourcekey="btnAprobarSocioResource1">
                        <ClientSideEvents Click="Aprobar"></ClientSideEvents>
                    </dx:ASPxButton>

                    <dx:ASPxButton ID="btnCerrarAprobacion" runat="server" Text="Cerrar" AutoPostBack="False" Theme="Moderno" ClientInstanceName="btnCerrarAprobacion"
                        CausesValidation="False" meta:resourcekey="btnCerrarAprobacionResource1">
                        <ClientSideEvents Click="CerrarAprobacion"></ClientSideEvents>
                    </dx:ASPxButton>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="popEnviarUsuario" HeaderText="Enviar Usuario" CloseAction="CloseButton"
        runat="server" ClientInstanceName="popEnviarUsuario" AllowDragging="True" EnableViewState="False"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="True" Theme="Moderno">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption"
                    AlignItemCaptionsInAllGroups="true" Width="100%" Theme="Moderno">
                    <Items>
                        <dx:LayoutGroup Caption="" GroupBoxDecoration="None" SettingsItemCaptions-HorizontalAlign="Right" ShowCaption="False">
                            <Items>
                                <dx:LayoutItem Caption="Correo:" HelpText="Ingrese el correo que ha confirmado vía telefónica">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxTextBox ID="txtCorreoEnviarUsuario" runat="server" Width="350px" Theme="Moderno" ClientInstanceName="txtCorreoEnviarUsuario">
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="valEnviarUsuario">
                                                    <RegularExpression ErrorText="Correo inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                    <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Lenguaje" HelpText="Idioma en el cual será enviado el correo">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="cmbIddiomaEnvUsuario" runat="server" ClientInstanceName="cmbIddiomaEnvUsuario" NullText="Seleccionar" Theme="Moderno" Width="350px">
                                                <Items>
                                                    <dx:ListEditItem Text="Español" Value="es-GT" />
                                                    <dx:ListEditItem Text="Ingles" Value="en-US" />
                                                </Items>
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="valEnviarUsuario">
                                                    <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>                                
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxButton ID="btnEnviarUsuario" runat="server" Text="Enviar" AutoPostBack="False" Theme="Moderno" ClientInstanceName="btnEnviarUsuario"
                                                CausesValidation="False">
                                                <ClientSideEvents Click="OnEnviarUsuario"></ClientSideEvents>
                                            </dx:ASPxButton>

                                            <dx:ASPxButton ID="btnCancelarEnvio" runat="server" Text="Cancelar" AutoPostBack="False" Theme="Moderno" ClientInstanceName="btnCancelarEnvio"
                                                CausesValidation="False">
                                                <ClientSideEvents Click="function(s, e) {popEnviarUsuario.Hide();}" />
                                            </dx:ASPxButton>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                            <SettingsItemCaptions HorizontalAlign="Right"></SettingsItemCaptions>
                        </dx:LayoutGroup>
                    </Items>
                    <Styles>
                        <LayoutGroupBox>
                            <Caption CssClass="layoutGroupBoxCaption"></Caption>
                        </LayoutGroupBox>
                    </Styles>
                </dx:ASPxFormLayout>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
